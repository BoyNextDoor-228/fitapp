import 'dart:io';

import 'package:app/feature/settings/domain/settings/settings.dart';
import 'package:app/repository/settings_hive_storage_repository.dart';
import 'package:app/repository/settings_repository.dart';
import 'package:hive/hive.dart';
import 'package:test/test.dart';

import 'mock/mock_settings.dart';

/// Testing SettingsRepository implementation with Hive.
///
/// First group tests updating settings in Hive Storage.
///
/// Second group tests saving mock settings in Hive storage.
///
/// Third group tests reading Settings from Hive storage and parsing
/// red data into [Settings] model.
void main() async {
  final settingsRepository = await initSettingsRepository();

  // Before running this group, make sure file 'test_fitapp_settings_box.hive'
  // doesn't exist.
  group('Settings Repository test: updating settings.', () {
    late Settings? actualSettings;
    late Settings expectedSettings;

    setUp(() async {
      expectedSettings = mockSettings;

      settingsRepository.updateSettings(updatedSettings: mockSettings);

      actualSettings = settingsRepository.settings;
    });

    test('Updating settings', () {
      expect(actualSettings, equals(expectedSettings));
    });
  });

  group('Settings Repository test: saving settings.', () {
    var isSuccess = false;

    setUp(() async {
      await settingsRepository.saveSettings();
      isSuccess = true;
    });

    test('Saving settings', () {
      expect(isSuccess, isTrue);
    });
  });

  // Before running this group, make sure file 'test_fitapp_settings_box.hive'
  // exists.
  group('Settings Repository test. Reading existing settings.', () {
    late Settings? actualSettings;
    late Settings expectedSettings;

    setUp(() async {
      expectedSettings = mockSettings;

      await settingsRepository.readSettings();
      actualSettings = settingsRepository.settings;
    });

    test('Settings are presented and successfully parsed.', () {
      expect(actualSettings, equals(expectedSettings));
    });
  });
}

Future<SettingsRepository> initSettingsRepository() async {
  final path = Directory.current.path;
  Hive.init(path);

  final storageRepository = SettingsHiveStorageRepository(
    settingsStorageBoxName: 'test_fitapp_settings_box',
    settingsKey: 'test_fitapp_settings_key',
    storagePath: path,
  );

  await storageRepository.clearStorage();

  return SettingsRepository.instance(storageRepository: storageRepository);
}
