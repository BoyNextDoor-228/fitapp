import 'dart:developer';

import 'package:fitapp_domain/domain.dart';

import '../feature/settings/domain/settings/settings.dart';
import '../feature/settings/domain/settings_values.dart';
import '../feature/settings/domain/theme_settings/theme_settings.dart';

class SettingsMockStorageRepository implements IStorageRepository<Settings> {
  /// Implements mock Storage Repository for storing settings information.
  SettingsMockStorageRepository();

  @override
  Future<void> clearStorage() => throw Exception('Unable clear mock storage');

  /// Reads and returns [Settings] from a storage.
  ///
  /// Returns [Null], if no settings presented in storage.
  @override
  Future<Settings?> read() => _readMockSettings();

  @override
  Future<void> save(Settings loadToSave) async =>
      throw Exception('Unable save in mock storage');

  /// Reads mock and returns [Settings].
  Future<Settings?> _readMockSettings() async {
    try {
      return Settings(
        themeSettings: ThemeSettings(
          brightness: ThemeBrightness.dark,
          color: FitAppColors.brightGreen.color,
          contrastLevel: ContrastLevels.medium,
        ),
        language: FitAppLanguages.english,
      );
    } on Exception catch (exception) {
      log('Could not read mock settings.');
      log('Exception message: $exception');
      return null;
    }
  }
}
