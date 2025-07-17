import 'package:flutter/material.dart';

class AppbarBurgerMenuButton extends StatelessWidget {
  /// Creates a button, which takes place in appbar and opens [Drawer] by tap
  /// action.
  const AppbarBurgerMenuButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
}
