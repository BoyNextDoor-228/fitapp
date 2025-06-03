import 'dart:developer';

import 'package:hive/hive.dart';

/// Deletes [Hive] box by passed [boxName] and [boxPath] if this box is
/// currently able to be deleted.
Future<void> deleteHiveBox({
  required String boxName,
  required String boxPath,
}) async {
  try {
    final canDeleteBox = await Hive.boxExists(boxName, path: boxPath) &&
        !Hive.isBoxOpen(boxName);

    if (canDeleteBox) {
      await Hive.deleteBoxFromDisk(boxName, path: boxPath);
    }
  } on Exception catch (exception) {
    log('Could not delete Hive Box named $boxName with path $boxPath');
    log('Exception message: $exception');
  }
}
