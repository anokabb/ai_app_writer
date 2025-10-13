import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/text_analysis_model.freezed.dart';
part 'gen/text_analysis_model.g.dart';

// Request models
@freezed
class TextAnalysisRequest with _$TextAnalysisRequest {
  const factory TextAnalysisRequest({
    required String text,
  }) = _TextAnalysisRequest;

  factory TextAnalysisRequest.fromJson(Map<String, dynamic> json) => _$TextAnalysisRequestFromJson(json);
}

@freezed
class HumanizationRequest with _$HumanizationRequest {
  const factory HumanizationRequest({
    required String text,
    double? humanLike,
    double? creativity,
  }) = _HumanizationRequest;

  factory HumanizationRequest.fromJson(Map<String, dynamic> json) => _$HumanizationRequestFromJson(json);
}

@freezed
class ContentGenerationRequest with _$ContentGenerationRequest {
  const factory ContentGenerationRequest({
    required String text,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
  }) = _ContentGenerationRequest;

  factory ContentGenerationRequest.fromJson(Map<String, dynamic> json) => _$ContentGenerationRequestFromJson(json);
}

// Response models
enum TextSource { ai, human, mixed }

@freezed
class TextAnalysisResult with _$TextAnalysisResult {
  const factory TextAnalysisResult({
    required TextSource source,
    @JsonKey(name: 'human_probability') required double humanProbability,
    List<String>? suggestions,
    String? explanation,
    // Enhanced fields for detailed analysis
    @JsonKey(name: 'total_sentences') int? totalSentences,
    @JsonKey(name: 'ai_generated_sentences') int? aiGeneratedSentences,
    @JsonKey(name: 'highlighted_sentences') List<String>? highlightedSentences,
    @JsonKey(name: 'detailed_title') String? detailedTitle,
    @JsonKey(name: 'summary_text') String? summaryText,
  }) = _TextAnalysisResult;

  factory TextAnalysisResult.fromJson(Map<String, dynamic> json) => _$TextAnalysisResultFromJson(json);

  const TextAnalysisResult._();

  bool get isAI => source == TextSource.ai;
  bool get isHuman => source == TextSource.human;
  bool get isMixed => source == TextSource.mixed;

  // Computed properties for UI
  String get displayTitle {
    switch (source) {
      case TextSource.ai:
        return 'Your text is likely to be written by AI';
      case TextSource.human:
        return 'Your text is likely to be written by a human';
      case TextSource.mixed:
        return 'Your text is likely to be written with a mix of AI and human';
    }
  }

  String? get displaySummary {
    if ((totalSentences ?? 0) != 0 && (aiGeneratedSentences ?? 0) != 0) {
      return '$aiGeneratedSentences/$totalSentences sentences are likely AI generated.';
    }
    return null;
  }

  // Return human percentage (high % = human, low % = AI)
  int get humanPercentage => (humanProbability * 100).round();

  // Keep aiPercentage for backwards compatibility (returns inverse)
  int get aiPercentage => humanPercentage;
}

@freezed
class HumanizationResult with _$HumanizationResult {
  const factory HumanizationResult({
    required String originalText,
    required String humanizedText,
    required double humanLike,
    List<String>? changes,
    String? explanation,
  }) = _HumanizationResult;

  factory HumanizationResult.fromJson(Map<String, dynamic> json) => _$HumanizationResultFromJson(json);
}

@freezed
class ContentGenerationResult with _$ContentGenerationResult {
  const factory ContentGenerationResult({
    required String originalText,
    required String generatedContent,
    required String typeOfWriting,
    required String tone,
    required int wordCount,
    required String language,
    List<String>? suggestions,
    String? explanation,
  }) = _ContentGenerationResult;

  factory ContentGenerationResult.fromJson(Map<String, dynamic> json) => _$ContentGenerationResultFromJson(json);
}
