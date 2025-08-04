import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../generated/l10n.dart';
import '../../repository/settings_hive_storage_repository.dart';
import '../../repository/settings_mock_storage_repository.dart';
import '../../repository/settings_repository.dart';
import '../../repository/user_hive_storage_repository.dart';
import '../../repository/user_mock_storage_repository.dart';
import '../../repository/user_repository.dart';
import '../../service/settings_service.dart';
import '../../service/user_service.dart';
import '../domain/app_config.dart';
import '../domain/environment.dart';
import '../navigation/app_router.dart';
import '../navigation/route_guard/user_presence_guard.dart';
import '../settings/domain/settings/settings.dart';

/// Implementation for [IAppScope].
class AppScope implements IAppScope {
  AppScope();

  late final UserService _userService;
  late final SettingsService _settingsService;

  late final AppRouter _router;

  /// Application configuration.
  late final AppConfig _appConfig;

  @override
  String get applicationName => _appConfig.appName;

  @override
  UserService get userService => _userService;

  @override
  SettingsService get settingsService => _settingsService;

  @override
  AppRouter get router => _router;

  @override
  List<LocalizationsDelegate> get localizationsDelegates =>
      const <LocalizationsDelegate<dynamic>>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @override
  List<Locale> get supportedLocales => S.delegate.supportedLocales;

  @override
  Future<void> init() async {
    _appConfig = Environment.instance.appConfig;

    await _initServices();

    _router = AppRouter(
      userPresenceGuard:
          UserPresenceGuard(isUserPresented: _userService.user != null),
    );
  }

  /// Initializes services, which Application consumes.
  Future<void> _initServices() async {
    final userRepository = await _createUserRepository();

    final settingsRepository = await _createSettingsRepository();

    _settingsService = SettingsService(settingsRepository: settingsRepository);
    _userService = UserService(userRepository: userRepository);
  }

  IStorageRepository<User> _createHiveUserStorageRepository() =>
      UserHiveStorageRepository(
        userStorageBoxName: _appConfig.hiveConfig!.userBoxName,
        userKey: _appConfig.hiveConfig!.userKeyName,
        storagePath: _appConfig.hiveConfig!.hiveStoragePath,
      );

  IStorageRepository<Settings> _createSettingsStorageRepository() =>
      SettingsHiveStorageRepository(
        settingsStorageBoxName: _appConfig.hiveConfig!.settingsBoxName,
        settingsKey: _appConfig.hiveConfig!.settingsKeyName,
        storagePath: _appConfig.hiveConfig!.hiveStoragePath,
      );

  Future<IUserRepository> _createUserRepository() async {
    if (_appConfig.hiveConfig == null) {
      return UserRepository.instance(
        storageRepository: UserMockStorageRepository(),
      );
    }

    return UserRepository.instance(
      storageRepository: _createHiveUserStorageRepository(),
    );
  }

  Future<ISettingsRepository> _createSettingsRepository() async {
    if (_appConfig.hiveConfig == null) {
      return SettingsRepository.instance(
        storageRepository: SettingsMockStorageRepository(),
      );
    }

    return SettingsRepository.instance(
      storageRepository: _createSettingsStorageRepository(),
    );
  }
}

/// Describes, what dependencies are needed for FitApp application.
abstract class IAppScope {
  /// Service for managing actions on a user.
  UserService get userService;

  /// Service for managing actions on app settings.
  SettingsService get settingsService;

  /// Name of application.
  String get applicationName;

  /// Application router.
  AppRouter get router;

  /// Localizations delegates.
  List<LocalizationsDelegate<dynamic>> get localizationsDelegates;

  /// Application's supported locales.
  List<Locale> get supportedLocales;

  /// All application dependencies initialization procedure.
  Future<void> init();
}
