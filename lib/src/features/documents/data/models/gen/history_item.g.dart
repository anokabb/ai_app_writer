// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryItemImpl _$$HistoryItemImplFromJson(Map<String, dynamic> json) =>
    _$HistoryItemImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      originalText: json['original_text'] as String,
      type: $enumDecode(_$HistoryItemTypeEnumMap, json['type']),
      title: json['title'] as String?,
      humanizedText: json['humanized_text'] as String?,
      humanizationResult: json['humanization_result'] == null
          ? null
          : HumanizationResult.fromJson(
              json['humanization_result'] as Map<String, dynamic>),
      generatedContent: json['generated_content'] as String?,
      generatorResult: json['generator_result'] == null
          ? null
          : GeneratorModel.fromJson(
              json['generator_result'] as Map<String, dynamic>),
      analysisResult: json['analysis_result'] == null
          ? null
          : TextAnalysisResult.fromJson(
              json['analysis_result'] as Map<String, dynamic>),
      typeOfWriting: json['type_of_writing'] as String?,
      tone: json['tone'] as String?,
      wordCount: (json['word_count'] as num?)?.toInt(),
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$HistoryItemImplToJson(_$HistoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'original_text': instance.originalText,
      'type': _$HistoryItemTypeEnumMap[instance.type]!,
      'title': instance.title,
      'humanized_text': instance.humanizedText,
      'humanization_result': instance.humanizationResult,
      'generated_content': instance.generatedContent,
      'generator_result': instance.generatorResult,
      'analysis_result': instance.analysisResult,
      'type_of_writing': instance.typeOfWriting,
      'tone': instance.tone,
      'word_count': instance.wordCount,
      'language': instance.language,
    };

const _$HistoryItemTypeEnumMap = {
  HistoryItemType.humanized: 'humanized',
  HistoryItemType.generated: 'generated',
};
