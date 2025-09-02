// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../generator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneratorModelImpl _$$GeneratorModelImplFromJson(Map<String, dynamic> json) =>
    _$GeneratorModelImpl(
      id: json['id'] as String,
      originalText: json['original_text'] as String,
      generatedContent: json['generated_content'] as String,
      typeOfWriting: json['type_of_writing'] as String,
      tone: json['tone'] as String,
      wordCount: (json['word_count'] as num).toInt(),
      language: json['language'] as String,
      suggestions: (json['suggestions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      explanation: json['explanation'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$GeneratorModelImplToJson(
        _$GeneratorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_text': instance.originalText,
      'generated_content': instance.generatedContent,
      'type_of_writing': instance.typeOfWriting,
      'tone': instance.tone,
      'word_count': instance.wordCount,
      'language': instance.language,
      'suggestions': instance.suggestions,
      'explanation': instance.explanation,
      'created_at': instance.createdAt?.toIso8601String(),
    };
