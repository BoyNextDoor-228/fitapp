import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NavigationFloatingActionButton extends StatelessWidget {
  const NavigationFloatingActionButton({
    required this.route,
    this.child,
    super.key,
  });

  final PageRouteInfo route;
  final Widget? child;

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        onPressed: () async => context.router.push(route),
        child: child ??
            const Icon(
              Icons.add_circle_outline_sharp,
              size: 40,
            ),
      );
}
