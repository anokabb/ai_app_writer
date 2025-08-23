import 'package:bloc/bloc.dart';
import 'package:diff_match_patch/diff_match_patch.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/data/llm/llm_client.dart';
import 'package:flutter_app_template/src/features/humanizer/domain/humanizer_options.dart';
import 'package:flutter_app_template/src/features/documents/repository/documents_repository.dart';
import 'package:flutter_app_template/src/features/documents/models/document_model.dart';
import 'package:flutter_app_template/src/features/humanizer/data/humanizer_queue.dart';
import 'package:flutter_app_template/src/core/services/network_service.dart';

part 'humanizer_state.dart';

class HumanizerCubit extends Cubit<HumanizerState> {
  final LlmClient _llm;
  final DocumentsRepository _docs;
  final DiffMatchPatch _diff = DiffMatchPatch();
  final HumanizerQueue _queue = HumanizerQueue();
  final NetworkService _network = NetworkService();

  HumanizerCubit()
      : _llm = locator<LlmClient>(),
        _docs = locator<DocumentsRepository>(),
        super(const HumanizerState.initial());

  Future<void> rewrite({required String input, required HumanizerOptions options}) async {
    emit(const HumanizerState.loading());
    final system = 'Rewrite the user text to improve clarity and readability without changing meaning. Tone: ${options.tone.name}. Target length: ${options.targetLength.name}. Keep keywords: ${options.keepKeywords.join(', ')}. Avoid making factual claims. Never mention detectors.';
    try {
      final online = await _network.checkConnection;
      if (!online) {
        await _queue.enqueue(HumanizerRequest(input: input, options: options));
        emit(const HumanizerState.error('Offline: queued for retry'));
        return;
      }
      final result = await _llm.complete(
        system: system,
        prompt: input,
        params: {
          'temperature': options.temperature,
          'max_tokens': 1024,
        },
      );
      final diffs = _diff.diffMain(input, result);
      _diff.diffCleanupSemantic(diffs);
      emit(HumanizerState.success(input: input, output: result, diffs: diffs));
    } catch (e) {
      // enqueue with backoff
      await _queue.enqueue(HumanizerRequest(
        input: input,
        options: options,
        attempts: 1,
        nextRetryAt: DateTime.now().add(const Duration(seconds: 5)),
      ));
      emit(HumanizerState.error('Request queued for retry'));
    }
  }

  Future<void> processQueue() async {
    final online = await _network.checkConnection;
    if (!online) return;
    final due = await _queue.dequeueDue();
    for (final req in due) {
      try {
        final result = await _llm.complete(
          system:
              'Rewrite the user text to improve clarity and readability without changing meaning. Tone: ${req.options.tone.name}. Target length: ${req.options.targetLength.name}. Keep keywords: ${req.options.keepKeywords.join(', ')}. Avoid making factual claims. Never mention detectors.',
          prompt: req.input,
          params: {'temperature': req.options.temperature, 'max_tokens': 1024},
        );
        final diffs = _diff.diffMain(req.input, result);
        _diff.diffCleanupSemantic(diffs);
        emit(HumanizerState.success(input: req.input, output: result, diffs: diffs));
      } catch (_) {
        final next = req.copyWith(
          attempts: req.attempts + 1,
          nextRetryAt: DateTime.now().add(Duration(seconds: 5 * (req.attempts + 1))),
        );
        final items = _queue.load();
        items.add(next);
        await _queue.save(items);
      }
    }
  }

  Future<AppDocument> saveDraft({required String title, required String content, required HumanizerOptions options}) async {
    final doc = await _docs.create(title: title, feature: 'humanizer', content: content, settings: options.toJson());
    return doc;
  }
}