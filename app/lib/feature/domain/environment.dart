// ignore_for_file: do_not_use_environment

import 'package:hive/hive.dart';
import 'app_config.dart';
import 'build_type.dart';
import 'hive_config.dart';

/// Describes environment, which is needed by Application.
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

  /// Initialization procedure.
  ///
  /// Collecting all required data from environment and initialization of
  /// [Environment] instance.
  static Future<void> init() async {
    const environmentName = String.fromEnvironment('fitapp_environmentName');
    const applicationName = String.fromEnvironment('fitapp_applicationName');

    HiveConfig? hiveConfig;

    if (environmentName == BuildType.dev.name ||
        environmentName == BuildType.prod.name) {
      hiveConfig = await HiveConfig.fromEnvironment();

      Hive.init(hiveConfig.hiveStoragePath);
    }

    _instance ??= Environment._(
      name: environmentName,
      appConfig: AppConfig(
        hiveConfig: hiveConfig,
        appName: applicationName,
      ),
    );
  }
}

// // ignore_for_file: do_not_use_environment
//
// import 'app_config.dart';
// import 'hive_config.dart';
//
// /// Describes environment, which is needed by Application.
// class Environment {
//   Environment._({
//     required this.name,
//     required this.appConfig,
//   });
//
//   // ignore: avoid-non-null-assertion
//   static Environment get instance => _instance!;
//   static Environment? _instance;
//
//   final String name;
//   final AppConfig appConfig;
//
//   /// Initialization procedure. Collecting all required data from environment.
//   static Future<void> init() async {
//     final hiveConfig = await HiveConfig.fromEnvironment();
//     const environmentName = String.fromEnvironment('fitapp_environmentName');
//     const applicationName = String.fromEnvironment('fitapp_applicationName');
//
//     _instance ??= Environment._(
//       name: environmentName,
//       appConfig: AppConfig(
//         hiveConfig: hiveConfig,
//         appName: applicationName,
//       ),
//     );
//   }
// }
