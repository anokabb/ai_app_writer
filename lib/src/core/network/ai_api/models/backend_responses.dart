import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/backend_responses.freezed.dart';
part 'gen/backend_responses.g.dart';

/// Detect endpoint response
@freezed
class BackendDetectResponse with _$BackendDetectResponse {
  const factory BackendDetectResponse({
    required bool success,
    required DetectData data,
    String? message,
  }) = _BackendDetectResponse;

  factory BackendDetectResponse.fromJson(Map<String, dynamic> json) => _$BackendDetectResponseFromJson(json);
}

@freezed
class DetectData with _$DetectData {
  const factory DetectData({
    required String source,
    @JsonKey(name: 'human_probability') required double humanProbability,
    required String explanation,
    required List<String> suggestions,
    @JsonKey(name: 'total_sentences') required int totalSentences,
    @JsonKey(name: 'ai_generated_sentences') required int aiGeneratedSentences,
    @JsonKey(name: 'highlighted_sentences') required List<String> highlightedSentences,
  }) = _DetectData;

  factory DetectData.fromJson(Map<String, dynamic> json) => _$DetectDataFromJson(json);
}

/// Humanize endpoint response
@freezed
class BackendHumanizeResponse with _$BackendHumanizeResponse {
  const factory BackendHumanizeResponse({
    required bool success,
    required HumanizeData data,
    String? message,
  }) = _BackendHumanizeResponse;

  factory BackendHumanizeResponse.fromJson(Map<String, dynamic> json) => _$BackendHumanizeResponseFromJson(json);
}

@freezed
class HumanizeData with _$HumanizeData {
  const factory HumanizeData({
    @JsonKey(name: 'original_text') required String originalText,
    @JsonKey(name: 'humanized_text') required String humanizedText,
    required double creativity,
  }) = _HumanizeData;

  factory HumanizeData.fromJson(Map<String, dynamic> json) => _$HumanizeDataFromJson(json);
}

/// Generate endpoint response
@freezed
class BackendGenerateResponse with _$BackendGenerateResponse {
  const factory BackendGenerateResponse({
    required bool success,
    required GenerateData data,
    String? message,
  }) = _BackendGenerateResponse;

  factory BackendGenerateResponse.fromJson(Map<String, dynamic> json) => _$BackendGenerateResponseFromJson(json);
}

@freezed
class GenerateData with _$GenerateData {
  const factory GenerateData({
    @JsonKey(name: 'original_text') required String originalText,
    @JsonKey(name: 'generated_content') required String generatedContent,
    @JsonKey(name: 'type_of_writing') required String typeOfWriting,
    required String tone,
    @JsonKey(name: 'word_count') required int wordCount,
    required String language,
  }) = _GenerateData;

  factory GenerateData.fromJson(Map<String, dynamic> json) => _$GenerateDataFromJson(json);
}
