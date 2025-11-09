// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../backend_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackendDetectResponseImpl _$$BackendDetectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BackendDetectResponseImpl(
      success: json['success'] as bool,
      data: DetectData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$BackendDetectResponseImplToJson(
        _$BackendDetectResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

_$DetectDataImpl _$$DetectDataImplFromJson(Map<String, dynamic> json) =>
    _$DetectDataImpl(
      source: json['source'] as String,
      humanProbability: (json['human_probability'] as num).toDouble(),
      explanation: json['explanation'] as String,
      suggestions: (json['suggestions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalSentences: (json['total_sentences'] as num).toInt(),
      aiGeneratedSentences: (json['ai_generated_sentences'] as num).toInt(),
      highlightedSentences: (json['highlighted_sentences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DetectDataImplToJson(_$DetectDataImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'human_probability': instance.humanProbability,
      'explanation': instance.explanation,
      'suggestions': instance.suggestions,
      'total_sentences': instance.totalSentences,
      'ai_generated_sentences': instance.aiGeneratedSentences,
      'highlighted_sentences': instance.highlightedSentences,
    };

_$BackendHumanizeResponseImpl _$$BackendHumanizeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BackendHumanizeResponseImpl(
      success: json['success'] as bool,
      data: HumanizeData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$BackendHumanizeResponseImplToJson(
        _$BackendHumanizeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

_$HumanizeDataImpl _$$HumanizeDataImplFromJson(Map<String, dynamic> json) =>
    _$HumanizeDataImpl(
      originalText: json['original_text'] as String,
      humanizedText: json['humanized_text'] as String,
      creativity: (json['creativity'] as num).toDouble(),
    );

Map<String, dynamic> _$$HumanizeDataImplToJson(_$HumanizeDataImpl instance) =>
    <String, dynamic>{
      'original_text': instance.originalText,
      'humanized_text': instance.humanizedText,
      'creativity': instance.creativity,
    };

_$BackendGenerateResponseImpl _$$BackendGenerateResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BackendGenerateResponseImpl(
      success: json['success'] as bool,
      data: GenerateData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$BackendGenerateResponseImplToJson(
        _$BackendGenerateResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

_$GenerateDataImpl _$$GenerateDataImplFromJson(Map<String, dynamic> json) =>
    _$GenerateDataImpl(
      originalText: json['original_text'] as String,
      generatedContent: json['generated_content'] as String,
      typeOfWriting: json['type_of_writing'] as String,
      tone: json['tone'] as String,
      wordCount: (json['word_count'] as num).toInt(),
      language: json['language'] as String,
    );

Map<String, dynamic> _$$GenerateDataImplToJson(_$GenerateDataImpl instance) =>
    <String, dynamic>{
      'original_text': instance.originalText,
      'generated_content': instance.generatedContent,
      'type_of_writing': instance.typeOfWriting,
      'tone': instance.tone,
      'word_count': instance.wordCount,
      'language': instance.language,
    };
