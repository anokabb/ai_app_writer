// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../text_analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextAnalysisRequestImpl _$$TextAnalysisRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TextAnalysisRequestImpl(
      text: json['text'] as String,
    );

Map<String, dynamic> _$$TextAnalysisRequestImplToJson(
        _$TextAnalysisRequestImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

_$HumanizationRequestImpl _$$HumanizationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$HumanizationRequestImpl(
      text: json['text'] as String,
      humanLike: (json['human_like'] as num?)?.toDouble(),
      creativity: (json['creativity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$HumanizationRequestImplToJson(
        _$HumanizationRequestImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'human_like': instance.humanLike,
      'creativity': instance.creativity,
    };

_$TextAnalysisResultImpl _$$TextAnalysisResultImplFromJson(
        Map<String, dynamic> json) =>
    _$TextAnalysisResultImpl(
      source: $enumDecode(_$TextSourceEnumMap, json['source']),
      aiProbability: (json['ai_probability'] as num).toDouble(),
      humanProbability: (json['human_probability'] as num).toDouble(),
      suggestions: (json['suggestions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      explanation: json['explanation'] as String?,
      totalSentences: (json['total_sentences'] as num?)?.toInt(),
      aiGeneratedSentences: (json['ai_generated_sentences'] as num?)?.toInt(),
      highlightedSentences: (json['highlighted_sentences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      detailedTitle: json['detailed_title'] as String?,
      summaryText: json['summary_text'] as String?,
    );

Map<String, dynamic> _$$TextAnalysisResultImplToJson(
        _$TextAnalysisResultImpl instance) =>
    <String, dynamic>{
      'source': _$TextSourceEnumMap[instance.source]!,
      'ai_probability': instance.aiProbability,
      'human_probability': instance.humanProbability,
      'suggestions': instance.suggestions,
      'explanation': instance.explanation,
      'total_sentences': instance.totalSentences,
      'ai_generated_sentences': instance.aiGeneratedSentences,
      'highlighted_sentences': instance.highlightedSentences,
      'detailed_title': instance.detailedTitle,
      'summary_text': instance.summaryText,
    };

const _$TextSourceEnumMap = {
  TextSource.ai: 'ai',
  TextSource.human: 'human',
  TextSource.mixed: 'mixed',
};

_$HumanizationResultImpl _$$HumanizationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$HumanizationResultImpl(
      originalText: json['original_text'] as String,
      humanizedText: json['humanized_text'] as String,
      humanLike: (json['human_like'] as num).toDouble(),
      changes:
          (json['changes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$$HumanizationResultImplToJson(
        _$HumanizationResultImpl instance) =>
    <String, dynamic>{
      'original_text': instance.originalText,
      'humanized_text': instance.humanizedText,
      'human_like': instance.humanLike,
      'changes': instance.changes,
      'explanation': instance.explanation,
    };
