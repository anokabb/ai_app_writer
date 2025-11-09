import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_page.dart';

import 'ai_repo.dart';
import 'backend_ai_repo.dart';
import 'openai_repo.dart';

/// AI Repository implementation with fallback mechanism
/// Tries backend first, falls back to OpenAI if backend fails
class AiRepoImpl implements AiRepo {
  final BackendAiRepo _backendRepo;
  final OpenAIRepo _openaiRepo;

  AiRepoImpl({
    required BackendAiRepo backendRepo,
    required OpenAIRepo openaiRepo,
  })  : _backendRepo = backendRepo,
        _openaiRepo = openaiRepo;

  @override
  Future<Either<AppError, TextAnalysisResult>> analyzeText({
    required String text,
    required DetectorModes mode,
  }) async {
    try {
      log('🔄 Attempting to analyze text with backend...');
      final backendResult = await _backendRepo.analyzeText(text: text, mode: mode);

      return backendResult.fold(
        (error) {
          log('⚠️ Backend failed: ${error.message}. Falling back to OpenAI...');
          return _openaiRepo.analyzeText(text: text, mode: mode);
        },
        (result) {
          log('✅ Backend analysis successful');
          return right(result);
        },
      );
    } catch (e) {
      log('❌ Backend error: $e. Falling back to OpenAI...');
      return _openaiRepo.analyzeText(text: text, mode: mode);
    }
  }

  @override
  Future<Either<AppError, HumanizationResult>> humanizeText(
    String text, {
    double? creativity,
  }) async {
    try {
      log('🔄 Attempting to humanize text with backend...');
      final backendResult = await _backendRepo.humanizeText(text, creativity: creativity);

      return backendResult.fold(
        (error) {
          log('⚠️ Backend failed: ${error.message}. Falling back to OpenAI...');
          return _openaiRepo.humanizeText(text, creativity: creativity);
        },
        (result) {
          log('✅ Backend humanization successful');
          return right(result);
        },
      );
    } catch (e) {
      log('❌ Backend error: $e. Falling back to OpenAI...');
      return _openaiRepo.humanizeText(text, creativity: creativity);
    }
  }

  @override
  Future<Either<AppError, ContentGenerationResult>> generateContent({
    required String text,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
  }) async {
    try {
      log('🔄 Attempting to generate content with backend...');
      final backendResult = await _backendRepo.generateContent(
        text: text,
        typeOfWriting: typeOfWriting,
        tone: tone,
        wordCount: wordCount,
        language: language,
      );

      return backendResult.fold(
        (error) {
          log('⚠️ Backend failed: ${error.message}. Falling back to OpenAI...');
          return _openaiRepo.generateContent(
            text: text,
            typeOfWriting: typeOfWriting,
            tone: tone,
            wordCount: wordCount,
            language: language,
          );
        },
        (result) {
          log('✅ Backend content generation successful');
          return right(result);
        },
      );
    } catch (e) {
      log('❌ Backend error: $e. Falling back to OpenAI...');
      return _openaiRepo.generateContent(
        text: text,
        typeOfWriting: typeOfWriting,
        tone: tone,
        wordCount: wordCount,
        language: language,
      );
    }
  }
}
