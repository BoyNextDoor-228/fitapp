import 'package:flutter/material.dart';

class AppbarBurgerMenuButton extends StatelessWidget {
  const AppbarBurgerMenuButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
}
