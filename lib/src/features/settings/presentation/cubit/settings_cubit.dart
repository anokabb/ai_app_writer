import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/features/settings/data/models/settings_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(settings: const SettingsModel())) {
    loadSettings();
  }

  Future<void> loadSettings() async {
    try {
      // Load settings model from Hive
      final settingsJson = cacheBox.get('settings');

      SettingsModel settings;
      if (settingsJson != null) {
        // Parse existing settings from JSON
        settings = SettingsModel.fromJson(Map<String, dynamic>.from(settingsJson));
      } else {
        settings = const SettingsModel();
      }

      emit(SettingsState(settings: settings));
    } catch (e) {
      emit(SettingsState(settings: SettingsModel()));
    }
  }

  Future<void> toggleAutoSave() async {
    final newSettings = state.settings.copyWith(
      autoSaveEnabled: !state.settings.autoSaveEnabled,
    );
    saveSettings(newSettings);
  }

  Future<void> toggleWritingTips() async {
    final newSettings = state.settings.copyWith(
      writingTips: !state.settings.writingTips,
    );
    saveSettings(newSettings);
  }

  Future<void> saveSettings(SettingsModel settings) async {
    try {
      await cacheBox.put('settings', settings.toJson());
      emit(SettingsState(settings: settings));
    } catch (e) {
      emit(SettingsState(settings: SettingsModel()));
    }
  }
}
