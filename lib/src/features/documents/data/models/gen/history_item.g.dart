// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryItemImpl _$$HistoryItemImplFromJson(Map<String, dynamic> json) =>
    _$HistoryItemImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      title: json['title'] as String,
      originalText: json['original_text'] as String,
      humanizedText: json['humanized_text'] as String,
      analysisResult: json['analysis_result'] == null
          ? null
          : TextAnalysisResult.fromJson(
              json['analysis_result'] as Map<String, dynamic>),
      humanizationResult: HumanizationResult.fromJson(
          json['humanization_result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HistoryItemImplToJson(_$HistoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'title': instance.title,
      'original_text': instance.originalText,
      'humanized_text': instance.humanizedText,
      'analysis_result': instance.analysisResult,
      'humanization_result': instance.humanizationResult,
    };
