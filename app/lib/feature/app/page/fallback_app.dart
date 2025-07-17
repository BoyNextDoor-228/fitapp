import 'package:flutter/material.dart';

import '../widget/fitapp_scaffold.dart';

/// Used whenever application's primary [MaterialApp] widget is not
/// initialized yet.
class FallbackApp extends StatelessWidget {
  const FallbackApp({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(
        themeMode: ThemeMode.dark,
        home: FitAppScaffold(
          body: child,
        ),
      );
}
