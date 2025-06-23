// ignore_for_file: do_not_use_environment
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  const HiveConfig._({
    required this.hiveStoragePath,
    required this.userBoxName,
    required this.settingsBoxName,
    required this.userKeyName,
    required this.settingsKeyName,
  });

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

  final String hiveStoragePath;

  final String userBoxName;
  final String settingsBoxName;

  final String userKeyName;
  final String settingsKeyName;
}
