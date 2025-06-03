import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'feature/domain/environment.dart';
import 'fit_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Environment.init();
  Hive.init(Environment.instance.appConfig.hiveConfig.hiveStoragePath);

  runApp(const FitApp());
}
