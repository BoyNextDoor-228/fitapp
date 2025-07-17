import 'dart:developer';

import 'package:fitapp_domain/domain.dart';

import '../feature/settings/domain/settings/settings.dart';

class SettingsRepository implements ISettingsRepository {
  /// Implements Settings Repository for managing actions on settings.
  SettingsRepository._({
    required IStorageRepository<Settings> storageRepository,
  }) : _storageRepository = storageRepository;

  /// A storage which implements reading and saving data.
  late final IStorageRepository<Settings> _storageRepository;

  /// Instance of settings.
  late Settings _settings;

  /// Asynchronous constructor of UserRepository
  static Future<SettingsRepository> instance({
    required IStorageRepository<Settings> storageRepository,
  }) async {
    try {
      final settingsRepository =
          SettingsRepository._(storageRepository: storageRepository);

      await settingsRepository._init();

      return settingsRepository;
    } on Exception catch (exception) {
      log('Could not create an instance of SettingsRepository');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Initializes settings.
  Future<void> _init() async {
    await readSettings();
  }

  @override
  Settings get settings => _settings;

  /// Reads settings info from a storage.
  /// If storage has no settings info, creates default settings.
  @override
  Future<void> readSettings() async {
    _settings = await _storageRepository.read() ?? Settings.byDefault();
  }

  /// Saves settings info in a storage.
  @override
  Future<void> saveSettings() async {
    await _storageRepository.save(_settings);
  }

  /// Updates settings info.
  @override
  void updateSettings({required Settings updatedSettings}) =>
      _settings = updatedSettings;
}

abstract class ISettingsRepository {
  Settings get settings;

  void updateSettings({required Settings updatedSettings});

  Future<void> readSettings();

  Future<void> saveSettings();
}
