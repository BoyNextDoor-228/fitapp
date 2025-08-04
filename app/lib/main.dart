import 'package:flutter/material.dart';

import 'feature/domain/environment.dart';
import 'fit_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const FitApp());
}

Future<void> init() async => Environment.init();
