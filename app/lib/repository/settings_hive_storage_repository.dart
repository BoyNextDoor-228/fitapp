import 'dart:convert';
import 'dart:developer';

import 'package:fitapp_domain/domain.dart';
import 'package:hive/hive.dart';

import '../feature/settings/domain/settings/settings.dart';
import '../tool/delete_hive_box_by_name.dart';

class SettingsHiveStorageRepository implements IStorageRepository<Settings> {
  /// Implements [Hive] Storage Repository for storing settings information.
  SettingsHiveStorageRepository({
    required this.settingsStorageBoxName,
    required this.settingsKey,
    required this.storagePath,
  });

  /// Name of [Hive] box, where settings info is stored in.
  final String settingsStorageBoxName;

  /// The key, which can be used for getting access to settings record in box.
  final String settingsKey;

  /// Path to storage file.
  final String storagePath;

  /// Clears [Hive] storage of [Settings].
  @override
  Future<void> clearStorage() =>
      deleteHiveBox(boxName: settingsStorageBoxName, boxPath: storagePath);

  /// Reads and returns [Settings] from a storage.
  ///
  /// Returns [Null], if no settings presented in storage.
  @override
  Future<Settings?> read() => _readSettingsFromHive();

  /// Saves settings, passed in [loadToSave] parameter, in a storage.
  @override
  Future<void> save(Settings loadToSave) async =>
      _saveSettingsInHive(settings: loadToSave);

  /// Reads box of settings from [Hive] and returns [Settings].
  ///
  /// Settings are stored as [Map<String, dynamic>].
  Future<Settings?> _readSettingsFromHive() async {
    try {
      // Generic type of [Map] is <dynamic, dynamic> and not <String, dynamic>,
      // because, despite this type was explicitly set, Hive.openBox() will
      // return Map<dynamic, dynamic> anyway.
      final settingsBox = await _openSettingsBox<Map<dynamic, dynamic>>();

      if (settingsBox.values.isEmpty) {
        return null;
      }

      // Raw settings mean they are not ready yet for returning from function.
      final rawSettings = settingsBox.values.first;

      final settings = _mapSettings(rawSettings);
      await settingsBox.close();

      return settings;
    } on Exception catch (exception) {
      log('Could not read settings from Hive.');
      log('Exception message: $exception');
      return null;
    }
  }

  /// Saves load, passed in [settings] parameter, in [Hive] settings box.
  Future<void> _saveSettingsInHive({required Settings settings}) async {
    try {
      final settingsBox = await _openSettingsBox<Map<dynamic, dynamic>>();
      final settingsJson = settings.toJson();

      await settingsBox.put(settingsKey, settingsJson);

      await settingsBox.close();
    } on Exception catch (exception) {
      log('Caught an exception during saving settings in Hive.\nSettings are: $settings');
      log('Exception message: $exception');
    }
  }

  /// Opens [Hive] settings box if it exists and returns it.
  ///
  /// If doesn't exist, creates it and then returns.
  Future<Box<E>> _openSettingsBox<E>() async {
    try {
      if (!await Hive.boxExists(settingsStorageBoxName)) {
        await _initStorage();
      }

      final settingsBox = await Hive.openBox<E>(
        settingsStorageBoxName,
        path: storagePath,
      );

      return settingsBox;
    } on Exception catch (exception) {
      log('Could not open Hive box with name $settingsStorageBoxName');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Maps [rawSettings] from [Map<dynamic dynamic>] to [Settings].
  Settings _mapSettings(Map<dynamic, dynamic> rawSettings) {
    try {
      final rawSettingsString = jsonEncode(rawSettings);

      final settingsJson =
          jsonDecode(rawSettingsString) as Map<String, dynamic>;

      return Settings.fromJson(settingsJson);
    } on Exception catch (exception) {
      log('Could not map raw settings to Settings.\nrawSettings are $rawSettings');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Creates settings box, if it doesn't exist.
  Future<void> _initStorage() async {
    try {
      if (await Hive.boxExists(settingsStorageBoxName)) {
        return;
      }

      final settingsBox =
          await Hive.openBox(settingsStorageBoxName, path: storagePath);
      await settingsBox.close();
    } on Exception catch (exception) {
      log('Could not initialize Hive storage.');
      log('Exception message: $exception');
    }
  }
}
