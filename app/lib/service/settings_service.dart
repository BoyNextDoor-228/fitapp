import 'dart:developer';

import '../feature/settings/domain/settings/settings.dart';
import '../feature/settings/domain/settings_values.dart';
import '../repository/settings_repository.dart';

/// Service for managing actions on app settings.
class SettingsService {
  SettingsService({required ISettingsRepository settingsRepository}) {
    _settingsRepository = settingsRepository;
    _updateSettings = settingsRepository.updateSettings;
    _saveSettings = settingsRepository.saveSettings;
  }

  /// A repository, which implements methods and properties for managing actions
  /// on settings.
  late final ISettingsRepository _settingsRepository;

  /// Callback which UPDATES settings in [_settingsRepository].
  late final void Function({required Settings updatedSettings}) _updateSettings;

  /// Callback which SAVES settings in a storage.
  late final Function() _saveSettings;

  /// Private getter of settings, described in [_settingsRepository].
  Settings get _settings => _settingsRepository.settings;

  /// Getter which returns settings, described in [_settingsRepository], for
  /// outer consumers.
  Settings get settings => _settingsRepository.settings;

  /// Edits theme brightness in settings and saves updates in a storage.
  Future<void> editThemeBrightness({
    required ThemeBrightness brightness,
  }) async {
    try {
      _updateSettings(
        updatedSettings: _settings.copyWith(
          themeSettings:
              _settings.themeSettings.copyWith(brightness: brightness),
        ),
      );
      await _saveSettings();
    } on Exception catch (exception) {
      log('Caught exception when editing Theme Brightness.');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits theme color in settings and saves updates in a storage.
  Future<void> editThemeColor({required int color}) async {
    try {
      _updateSettings(
        updatedSettings: _settings.copyWith(
          themeSettings: _settings.themeSettings.copyWith(color: color),
        ),
      );
      await _saveSettings();
    } on Exception catch (exception) {
      log('Caught exception when editing Theme Color.');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits theme contrast level in settings and saves updates in a storage.
  Future<void> editThemeContrastLevel({required double contrastLevel}) async {
    try {
      _updateSettings(
        updatedSettings: _settings.copyWith(
          themeSettings:
              _settings.themeSettings.copyWith(contrastLevel: contrastLevel),
        ),
      );
      await _saveSettings();
    } on Exception catch (exception) {
      log('Caught exception when editing Theme Contrast Level.');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits application interface language in settings and saves updates in
  /// a storage.
  Future<void> editAppLanguage({required FitAppLanguages language}) async {
    try {
      _updateSettings(updatedSettings: _settings.copyWith(language: language));
      await _saveSettings();
    } on Exception catch (exception) {
      log('Caught exception when editing Application Language.');
      log('Exception message: $exception');
      rethrow;
    }
  }
}
