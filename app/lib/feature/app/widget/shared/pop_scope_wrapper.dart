import 'package:flutter/material.dart';

class PopScopeWrapper extends StatelessWidget {
  /// Implements showing [Drawer] behaviour on system 'back button' pressed.
  const PopScopeWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, Object? result) {
            if (didPop) {
              return;
            }
            if (context.mounted) {
              Scaffold.of(context).openDrawer();
            }
          },
          child: child,
        ),
      );
}
