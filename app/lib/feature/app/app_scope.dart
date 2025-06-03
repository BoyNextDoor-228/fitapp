import 'package:fitapp_domain/domain.dart';

import '../../repository/settings_hive_storage_repository.dart';
import '../../repository/settings_repository.dart';
import '../../repository/user_hive_storage_repository.dart';
import '../../repository/user_repository.dart';
import '../../service/settings_service.dart';
import '../../service/user_service.dart';
import '../domain/app_config.dart';
import '../domain/environment.dart';
import '../navigation/app_router.dart';
import '../navigation/route_guard/user_presence_guard.dart';
import '../settings/domain/settings/settings.dart';

class AppScope implements IAppScope {
  AppScope();

  late final UserService _userService;
  late final SettingsService _settingsService;

  late final AppRouter _router;

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
  Future<void> init() async {
    _appConfig = Environment.instance.appConfig;

    await _initServices();

    _router = AppRouter(
      userPresenceGuard: UserPresenceGuard(userService: _userService),
    );
  }

  Future<void> _initServices() async {
    final userRepository = await _createUserRepository();

    final settingsRepository = await _createSettingsRepository();

    _settingsService = SettingsService(settingsRepository: settingsRepository);
    _userService = UserService(userRepository: userRepository);
  }

  IStorageRepository<User> _createUserStorageRepository() =>
      UserHiveStorageRepository(
        userStorageBoxName: _appConfig.hiveConfig.userBoxName,
        userKey: _appConfig.hiveConfig.userKeyName,
        storagePath: _appConfig.hiveConfig.hiveStoragePath,
      );

  IStorageRepository<Settings> _createSettingsStorageRepository() =>
      SettingsHiveStorageRepository(
        settingsStorageBoxName: _appConfig.hiveConfig.settingsBoxName,
        settingsKey: _appConfig.hiveConfig.settingsKeyName,
        storagePath: _appConfig.hiveConfig.hiveStoragePath,
      );

  Future<IUserRepository> _createUserRepository() async =>
      UserRepository.instance(
        storageRepository: _createUserStorageRepository(),
      );

  Future<ISettingsRepository> _createSettingsRepository() async =>
      SettingsRepository.instance(
        storageRepository: _createSettingsStorageRepository(),
      );
}

abstract class IAppScope {
  UserService get userService;

  SettingsService get settingsService;

  String get applicationName;

  AppRouter get router;

  Future<void> init();
}
