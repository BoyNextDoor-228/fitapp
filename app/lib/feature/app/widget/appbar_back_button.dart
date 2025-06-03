import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
        onPressed: () => context.router.pop(),
      );
}
