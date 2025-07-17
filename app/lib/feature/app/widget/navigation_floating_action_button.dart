import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../tool/route_provider.dart';

class NavigationFloatingActionButton extends StatelessWidget {
  /// Creates [FloatingActionButton], which navigates to [route] on tap action.
  ///
  /// [child] is a child of [FloatingActionButton]. Default is 'Plus' icon.
  const NavigationFloatingActionButton({
    required this.route,
    this.child,
    super.key,
  });

  final PageRouteInfo route;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final router = context.router;

    const defaultIcon = Icon(
      Icons.add_circle_outline_sharp,
      size: 40,
    );

    return FloatingActionButton(
      onPressed: () async => goToRoute(router: router, route: route),
      child: child ?? defaultIcon,
    );
  }
}
