import 'dart:io';

import 'package:app/feature/settings/domain/settings_values.dart';
import 'package:app/repository/settings_hive_storage_repository.dart';
import 'package:app/repository/settings_repository.dart';
import 'package:app/service/settings_service.dart';
import 'package:hive/hive.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final settingsService = await initSettingsService();

  group('Settings Service test. Editing theme brightness.', () {
    late ThemeBrightness? actualThemeBrightness;
    late ThemeBrightness expectedThemeBrightness;

    late ThemeBrightness editedThemeBrightness;

    setUp(() async {
      editedThemeBrightness = ThemeBrightness.dark;

      expectedThemeBrightness = editedThemeBrightness;

      await settingsService.editThemeBrightness(
        brightness: editedThemeBrightness,
      );

      actualThemeBrightness = settingsService.settings.themeSettings.brightness;
    });

    test('Editing theme brightness.', () {
      expect(actualThemeBrightness, equals(expectedThemeBrightness));
    });
  });

  group('Settings Service test. Editing theme color.', () {
    late FitAppColors expectedColor;

    late FitAppColors editedColor;

    late bool colorsMatch;

    setUp(() async {
      editedColor = FitAppColors.brightGreen;

      expectedColor = editedColor;

      await settingsService.editThemeColor(
        color: editedColor.color,
      );

      colorsMatch =
          expectedColor.color == settingsService.settings.themeSettings.color;
    });

    test('Editing theme color.', () {
      expect(colorsMatch, isTrue);
    });
  });

  group('Settings Service test. Editing theme contrast level.', () {
    late ContrastLevels? actualContrastLevel;
    late ContrastLevels expectedContrastLevel;

    late ContrastLevels editedContrastLevel;

    setUp(() async {
      editedContrastLevel = ContrastLevels.low;

      expectedContrastLevel = editedContrastLevel;

      await settingsService.editThemeContrastLevel(
        contrastLevel: editedContrastLevel,
      );

      actualContrastLevel =
          settingsService.settings.themeSettings.contrastLevel;
    });

    test('Editing theme contrast level.', () {
      expect(actualContrastLevel, equals(expectedContrastLevel));
    });
  });

  group('Settings Service test. Editing app language.', () {
    late FitAppLanguages? actualLanguage;
    late FitAppLanguages expectedLanguage;

    late FitAppLanguages editedLanguage;

    setUp(() async {
      editedLanguage = FitAppLanguages.russian;

      expectedLanguage = editedLanguage;

      await settingsService.editAppLanguage(
        language: editedLanguage,
      );

      actualLanguage = settingsService.settings.language;
    });

    test('Editing app language.', () {
      expect(actualLanguage, equals(expectedLanguage));
    });
  });
}

Future<SettingsService> initSettingsService() async {
  final path = Directory.current.path;
  Hive.init(path);

  final storageRepository = SettingsHiveStorageRepository(
    settingsStorageBoxName: 'test_fitapp_settings_box',
    settingsKey: 'test_fitapp_settings_key',
    storagePath: path,
  );

  await storageRepository.clearStorage();

  final settingsRepository = await SettingsRepository.instance(
    storageRepository: storageRepository,
  );

  return SettingsService(settingsRepository: settingsRepository);
}
