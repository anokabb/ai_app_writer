// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      autoSaveEnabled: json['auto_save_enabled'] as bool? ?? true,
      writingTips: json['writing_tips'] as bool? ?? true,
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'auto_save_enabled': instance.autoSaveEnabled,
      'writing_tips': instance.writingTips,
    };
