// ignore_for_file: do_not_use_environment

import 'app_config.dart';
import 'hive_config.dart';

class Environment {
  Environment._({
    required this.name,
    required this.appConfig,
  });

  // ignore: avoid-non-null-assertion
  static Environment get instance => _instance!;
  static Environment? _instance;

  final String name;
  final AppConfig appConfig;

  static Future<void> init() async {
    final hiveConfig = await HiveConfig.fromEnvironment();
    const environmentName = String.fromEnvironment('fitapp_environmentName');
    const applicationName = String.fromEnvironment('fitapp_applicationName');

    _instance ??= Environment._(
      name: environmentName,
      appConfig: AppConfig(
        hiveConfig: hiveConfig,
        appName: applicationName,
      ),
    );
  }
}
