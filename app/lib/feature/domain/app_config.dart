import 'hive_config.dart';

class AppConfig {
  /// Application configuration.
  ///
  /// [appName] is a name of Application.
  /// [hiveConfig] is a configuration for Hive.
  AppConfig({
    required this.hiveConfig,
    required this.appName,
  });

  final HiveConfig? hiveConfig;
  final String appName;
}
