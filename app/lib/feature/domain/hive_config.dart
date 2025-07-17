// ignore_for_file: do_not_use_environment
import 'package:path_provider/path_provider.dart';

/// Configuration for Hive.
class HiveConfig {
  const HiveConfig._({
    required this.hiveStoragePath,
    required this.userBoxName,
    required this.settingsBoxName,
    required this.userKeyName,
    required this.settingsKeyName,
  });

  /// Returns [HiveConfig] based on data from environment.
  static Future<HiveConfig> fromEnvironment() async {
    final storageDirectory = await getApplicationDocumentsDirectory();

    const userBoxName = String.fromEnvironment('fitapp_user_box_name');
    const userKeyName = String.fromEnvironment('fitapp_user_key_name');

    const settingsBoxName = String.fromEnvironment('fitapp_settings_box_name');
    const settingsKeyName = String.fromEnvironment('fitapp_settings_key_name');

    return HiveConfig._(
      hiveStoragePath: storageDirectory.path,
      userBoxName: userBoxName,
      userKeyName: userKeyName,
      settingsBoxName: settingsBoxName,
      settingsKeyName: settingsKeyName,
    );
  }

  /// Path to Hive storage file.
  final String hiveStoragePath;

  /// Name of Hive box, where user's data is stored.
  final String userBoxName;

  /// Name of Hive box, where settings' data is stored.
  final String settingsBoxName;

  /// Name of key, which is used to get access to user data.
  final String userKeyName;

  /// Name of key, which is used to get access to settings data.
  final String settingsKeyName;
}
