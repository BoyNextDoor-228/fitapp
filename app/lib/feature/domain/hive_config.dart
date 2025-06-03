// ignore_for_file: do_not_use_environment
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  const HiveConfig._({
    required this.hiveStoragePath,
    required this.userBoxName,
    required this.settingsBoxName,
    required this.productsBoxName,
    required this.abstractExercisesBoxName,
    required this.userKeyName,
    required this.settingsKeyName,
    required this.productsKeyName,
    required this.abstractExercisesKeyName,
  });

  static Future<HiveConfig> fromEnvironment() async {
    final storageDirectory = await getApplicationDocumentsDirectory();

    const userBoxName = String.fromEnvironment('fitapp_user_box_name');
    const userKeyName = String.fromEnvironment('fitapp_user_key_name');

    const settingsBoxName = String.fromEnvironment('fitapp_settings_box_name');
    const settingsKeyName = String.fromEnvironment('fitapp_settings_key_name');

    const productsBoxName = String.fromEnvironment('fitapp_products_box_name');
    const productsKeyName = String.fromEnvironment('fitapp_products_key_name');

    const abstractExercisesBoxName =
        String.fromEnvironment('fitapp_abstract_exercises_box_name');
    const abstractExercisesKeyName =
        String.fromEnvironment('fitapp_abstract_exercises_name');

    return HiveConfig._(
      hiveStoragePath: storageDirectory.path,
      userBoxName: userBoxName,
      userKeyName: userKeyName,
      settingsBoxName: settingsBoxName,
      settingsKeyName: settingsKeyName,
      productsBoxName: productsBoxName,
      productsKeyName: productsKeyName,
      abstractExercisesBoxName: abstractExercisesBoxName,
      abstractExercisesKeyName: abstractExercisesKeyName,
    );
  }

  final String hiveStoragePath;

  final String userBoxName;
  final String settingsBoxName;
  final String productsBoxName;
  final String abstractExercisesBoxName;

  final String userKeyName;
  final String settingsKeyName;
  final String productsKeyName;
  final String abstractExercisesKeyName;
}
