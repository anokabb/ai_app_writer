import 'dart:developer';

import 'package:flutter_app_template/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:flutter_app_template/src/core/network/ai_api/repos/ai_repo.dart';
import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/detector/presentation/pages/detector_page.dart';
import 'package:flutter_app_template/src/features/documents/data/models/history_item.dart';
import 'package:flutter_app_template/src/features/documents/data/repos/history_repo.dart';
import 'package:flutter_app_template/src/features/documents/presentation/cubit/history_state.dart';
import 'package:flutter_app_template/src/features/generator/data/models/generator_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo _historyRepo;
  final AiRepo _aiRepo;

  HistoryCubit(this._historyRepo, this._aiRepo) : super(const HistoryState.initial()) {
    loadHistory();
  }

  // /// Generate a concise title for content using AI
  // Future<String> _generateTitle(String content, HistoryItemType type) async {
  //   try {
  //     final prompt = type == HistoryItemType.humanized
  //         ? 'Generate a concise, descriptive title (max 8 words) for this humanized text: "$content"'
  //         : 'Generate a concise, descriptive title (max 8 words) for this generated content: "$content"';

  //     final response = await _aiRepo.generateTitle(prompt);
  //     return response.fold(
  //       (error) => _generateFallbackTitle(content, type),
  //       (title) => title.trim().isEmpty ? _generateFallbackTitle(content, type) : title.trim(),
  //     );
  //   } catch (e) {
  //     return _generateFallbackTitle(content, type);
  //   }
  // }

  /// Generate a fallback title when AI fails
  String _generateFallbackTitle(String content, HistoryItemType type) {
    final prefix = type == HistoryItemType.humanized ? 'Humanized' : 'Generated';
    final words = content.split(' ').take(5).join(' ');
    return '$prefix: ${words.length > 30 ? '${words.substring(0, 30)}...' : words}';
  }

  Future<void> loadHistory() async {
    emit(const HistoryState.loading());

    try {
      final history = await _historyRepo.getHistory();
      emit(HistoryState.loaded(history));
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
    }
  }

  Future<bool> save({required HumanizationResult result, required String originalText}) async {
    bool saved = false;
    try {
      final res = await _aiRepo.analyzeText(text: result.humanizedText, mode: DetectorModes.quick);
      TextAnalysisResult? analysisResult = res.fold((l) => null, (r) => r);

      // Generate AI title for the content
      // final title = await _generateTitle(result.humanizedText, HistoryItemType.humanized);

      HistoryItem historyItem = HistoryItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp: DateTime.now(),
        originalText: originalText,
        type: HistoryItemType.humanized,
        title: null,
        humanizedText: result.humanizedText,
        analysisResult: analysisResult,
        humanizationResult: result,
      );

      await _historyRepo.addHistoryItem(historyItem);

      // Reload history to update the UI
      await loadHistory();
      saved = true;
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
      saved = false;
    }
    if (saved) {
      Utils.showToast('Saved to docs');
    } else {
      Utils.showToast('Failed to save to docs');
    }
    return saved;
  }

  Future<bool> saveGeneratedContent({required GeneratorModel result, required String originalText}) async {
    bool saved = false;
    try {
      // Generate AI title for the content
      // final title = await _generateTitle(result.generatedContent, HistoryItemType.generated);

      HistoryItem historyItem = HistoryItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp: DateTime.now(),
        originalText: originalText,
        type: HistoryItemType.generated,
        title: null,
        generatedContent: result.generatedContent,
        generatorResult: result,
        analysisResult: null,
        typeOfWriting: result.typeOfWriting,
        tone: result.tone,
        wordCount: result.wordCount,
        language: result.language,
      );

      await _historyRepo.addHistoryItem(historyItem);

      // Reload history to update the UI
      await loadHistory();
      saved = true;
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
      saved = false;
    }
    if (saved) {
      Utils.showToast('Saved to docs');
    } else {
      Utils.showToast('Failed to save to docs');
    }
    return saved;
  }

  Future<void> addHistoryItem(HistoryItem item) async {
    try {
      await _historyRepo.addHistoryItem(item);
      // Reload history to update the UI
      await loadHistory();
    } catch (e) {
      // Don't emit error for adding items, just silently fail
      log('Error adding history item: $e');
    }
  }

  Future<void> deleteHistoryItem(String id) async {
    try {
      await _historyRepo.deleteHistoryItem(id);
      // Reload history to update the UI
      await loadHistory();
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
    }
  }

  Future<void> clearHistory() async {
    try {
      await _historyRepo.clearHistory();
      emit(const HistoryState.loaded([]));
    } catch (e) {
      emit(HistoryState.error(AppError.fromException(e)));
    }
  }

  Future<HistoryItem?> getHistoryItem(String id) async {
    try {
      return await _historyRepo.getHistoryItem(id);
    } catch (e) {
      return null;
    }
  }
}
