import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/settings_model.freezed.dart';
part 'gen/settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    @Default(true) bool autoSaveEnabled,
    @Default(true) bool writingTips,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);
}
