import 'dart:io';

import 'package:app/feature/settings/domain/settings/settings.dart';
import 'package:app/repository/settings_hive_storage_repository.dart';
import 'package:hive/hive.dart';
import 'package:test/test.dart';

import 'mock/mock_settings.dart';

/// Testing SettingsStorageRepository implementation with Hive.
///
/// First group tests absence of settings in Hive because of absence of
/// .hive file.
///
/// Second group tests saving mock settings in Hive storage.
///
/// Third group tests reading settings from Hive storage and parsing
/// red data into [Settings] model.
void main() async {
  final storageRepository = await initStorageRepository();

  // Before running this group, make sure file 'test_fitapp_settings_box.hive'
  // doesn't exist
  group('Reading settings from Hive. Settings are absent', () {
    late bool areSettingsAbsent;

    setUp(() async {
      areSettingsAbsent = await storageRepository.read() == null;
    });

    test('Settings are absent and equal null.', () {
      expect(areSettingsAbsent, isTrue);
    });
  });

  group('Settings storage test: saving settings in Hive', () {
    var isSuccess = false;

    setUp(() async {
      await storageRepository.save(mockSettings);
      isSuccess = true;
    });

    test('Saving settings', () {
      expect(isSuccess, isTrue);
    });
  });

  // Before running this group, make sure file 'test_fitapp_settings_box.hive'
  // exists.
  group('Reading settings from Hive. Settings are presented', () {
    late Settings? actualSettings;
    late Settings expectedSettings;

    setUp(() async {
      expectedSettings = mockSettings;

      actualSettings = await storageRepository.read();
    });

    test('Settings are presented and successfully parsed.', () async {
      expect(actualSettings, equals(expectedSettings));
    });
  });
}

Future<SettingsHiveStorageRepository> initStorageRepository() async {
  final path = Directory.current.path;
  Hive.init(path);

  final storageRepository = SettingsHiveStorageRepository(
    settingsStorageBoxName: 'test_fitapp_settings_box',
    settingsKey: 'test_fitapp_settings_key',
    storagePath: path,
  );

  await storageRepository.clearStorage();

  return storageRepository;
}
