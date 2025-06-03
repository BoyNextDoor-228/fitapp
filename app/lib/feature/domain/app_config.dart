import 'hive_config.dart';

class AppConfig {
  AppConfig({
    required this.hiveConfig,
    required this.appName,
  });

  final HiveConfig hiveConfig;
  final String appName;
}
