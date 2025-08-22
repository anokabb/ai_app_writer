import 'package:bloc/bloc.dart';
import 'package:diff_match_patch/diff_match_patch.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/data/llm/llm_client.dart';
import 'package:flutter_app_template/src/features/humanizer/domain/humanizer_options.dart';
import 'package:flutter_app_template/src/features/documents/repository/documents_repository.dart';
import 'package:flutter_app_template/src/features/documents/models/document_model.dart';

part 'humanizer_state.dart';

class HumanizerCubit extends Cubit<HumanizerState> {
  final LlmClient _llm;
  final DocumentsRepository _docs;
  final DiffMatchPatch _diff = DiffMatchPatch();

  HumanizerCubit()
      : _llm = locator<LlmClient>(),
        _docs = locator<DocumentsRepository>(),
        super(const HumanizerState.initial());

  Future<void> rewrite({required String input, required HumanizerOptions options}) async {
    emit(const HumanizerState.loading());
    final system = 'Rewrite the user text to improve clarity and readability without changing meaning. Tone: ${options.tone.name}. Target length: ${options.targetLength.name}. Keep keywords: ${options.keepKeywords.join(', ')}. Avoid making factual claims. Never mention detectors.';
    try {
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
      emit(HumanizerState.error(e.toString()));
    }
  }

  Future<AppDocument> saveDraft({required String title, required String content, required HumanizerOptions options}) async {
    final doc = await _docs.create(title: title, feature: 'humanizer', content: content, settings: options.toJson());
    return doc;
  }
}