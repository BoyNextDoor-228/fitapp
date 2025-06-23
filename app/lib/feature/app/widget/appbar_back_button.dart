import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../tool/route_provider.dart';

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({
    required this.route,
    super.key,
  });

  final PageRouteInfo route;

  @override
  Widget build(BuildContext context) {
    final router = context.router;

    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_sharp),
      onPressed: () async => goToRoute(
        router: router,
        route: route,
      ),
    );
  }
}
