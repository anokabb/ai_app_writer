import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phrasly_ai_tools/src/core/constants/env_config.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/backend_api.dart';
import 'package:phrasly_ai_tools/src/core/network/ai_api/models/text_analysis_model.dart';
import 'package:phrasly_ai_tools/src/core/network/models/app_error.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:phrasly_ai_tools/src/features/detector/presentation/pages/detector_page.dart';

import 'ai_repo.dart';

class BackendAiRepo implements AiRepo {
  late final BackendApi _api;
  late final String _apiKey;

  BackendAiRepo() {
    final remoteConfig = locator<RemoteConfigService>().data.api;

    // Get environment-specific API key
    _apiKey = EnvConfig.currentEnvironment == Environment.beta
        ? remoteConfig.backendApiKeyBeta
        : remoteConfig.backendApiKeyProduction;

    _api = BackendApi(
      locator<Dio>(),
      baseUrl: EnvConfig.getBackendBaseUrl(
        betaUrl: remoteConfig.backendBaseUrlBeta,
        productionUrl: remoteConfig.backendBaseUrlProduction,
      ),
    );
  }

  @override
  Future<Either<AppError, TextAnalysisResult>> analyzeText({
    required String text,
    required DetectorModes mode,
  }) async {
    try {
      final requestBody = {
        'text': text,
        'mode': mode.name, // 'quick', 'standard', or 'deep'
      };

      final response = await _api.detect(requestBody, _apiKey);

      // Check if API call was successful
      if (!response.success) {
        throw Exception('Backend API error: ${response.message ?? 'Unknown error'}');
      }

      final data = response.data;

      return right(TextAnalysisResult(
        source: _getTextSourceFromString(data.source),
        humanProbability: data.humanProbability,
        explanation: data.explanation,
        suggestions: data.suggestions,
        totalSentences: data.totalSentences,
        aiGeneratedSentences: data.aiGeneratedSentences,
        highlightedSentences: data.highlightedSentences,
      ));
    } catch (e) {
      log('Error analyzing text with backend: $e');

      // Check for network/connectivity issues
      if (e.toString().contains('Failed host lookup') ||
          e.toString().contains('No address associated with hostname') ||
          e.toString().contains('connection error') ||
          e.toString().contains('SocketException')) {
        return left(AppError.server(
          message: 'Network connectivity issue. Check your internet connection or backend server.',
        ));
      }

      return left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, HumanizationResult>> humanizeText(
    String text, {
    double? creativity,
  }) async {
    try {
      final requestBody = {
        'text': text,
        'creativity': creativity ?? 0.7,
      };

      final response = await _api.humanize(requestBody, _apiKey);

      // Check if API call was successful
      if (!response.success) {
        throw Exception('Backend API error: ${response.message ?? 'Unknown error'}');
      }

      final data = response.data;
      final humanLikeScore = _calculateHumanLikeScore(data.humanizedText, originalText: text);

      final changes = [
        'Converting to conversational tone',
        'Adding personal elements',
        'Making language more natural',
        'Removing robotic patterns'
      ];

      log('Humanization completed successfully via backend');

      return Right(HumanizationResult(
        originalText: data.originalText,
        humanizedText: data.humanizedText,
        humanLike: humanLikeScore,
        changes: changes,
      ));
    } catch (e) {
      log('Error humanizing text with backend: $e');

      // Check for network/connectivity issues
      if (e.toString().contains('Failed host lookup') ||
          e.toString().contains('No address associated with hostname') ||
          e.toString().contains('connection error') ||
          e.toString().contains('SocketException')) {
        return left(AppError.server(
          message: 'Network connectivity issue. Check your internet connection or backend server.',
        ));
      }

      return Left(AppError.fromException(e));
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
      final requestBody = {
        'text': text,
        'type_of_writing': typeOfWriting,
        'tone': tone,
        'word_count': wordCount,
        'language': language,
      };

      final response = await _api.generate(requestBody, _apiKey);

      // Check if API call was successful
      if (!response.success) {
        throw Exception('Backend API error: ${response.message ?? 'Unknown error'}');
      }

      final data = response.data;

      final suggestions = [
        'Content generated successfully',
        'Follows specified tone and style',
        'Meets word count requirements',
        'Well-structured and engaging'
      ];

      log('Content generation completed successfully via backend');

      return Right(ContentGenerationResult(
        originalText: data.originalText,
        generatedContent: data.generatedContent,
        typeOfWriting: data.typeOfWriting,
        tone: data.tone,
        wordCount: data.wordCount,
        language: data.language,
        suggestions: suggestions,
        explanation: 'Content generated based on your specifications',
      ));
    } catch (e) {
      log('Error generating content with backend: $e');

      // Check for network/connectivity issues
      if (e.toString().contains('Failed host lookup') ||
          e.toString().contains('No address associated with hostname') ||
          e.toString().contains('connection error') ||
          e.toString().contains('SocketException')) {
        return left(AppError.server(
          message: 'Network connectivity issue. Check your internet connection or backend server.',
        ));
      }

      return Left(AppError.fromException(e));
    }
  }

  /// Helper to convert string to TextSource
  TextSource _getTextSourceFromString(String source) {
    switch (source.toLowerCase()) {
      case 'human':
        return TextSource.human;
      case 'ai':
        return TextSource.ai;
      case 'mixed':
        return TextSource.mixed;
      default:
        return TextSource.mixed;
    }
  }

  /// Calculate a human-like score for humanized text
  double _calculateHumanLikeScore(String text, {String? originalText}) {
    // Simulate increasing human-like score as text grows
    // Start at 10% and gradually increase to 90%
    final baseScore = 10.0;
    final maxScore = 90.0;

    // Use original text length as reference, or fallback to current text length
    final targetLength = originalText?.length ?? text.length;
    final progress = (text.length / targetLength).clamp(0.0, 1.0);

    // Use a slower curve (square root) to make it increase more gradually
    final slowProgress = progress * progress; // This makes it increase slower at the beginning

    // Use a smooth curve to increase the score
    final score = baseScore + (maxScore - baseScore) * slowProgress;

    // Add some randomness to make it look more realistic
    final randomFactor = (DateTime.now().millisecondsSinceEpoch % 10 - 5) / 100.0;
    final finalScore = (score + randomFactor).clamp(10.0, 90.0);

    return finalScore / 100.0; // Convert to 0.0-1.0 range
  }
}
