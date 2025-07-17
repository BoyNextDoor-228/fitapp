import 'package:auto_route/auto_route.dart';

/// Redirects to desired [route].
Future<void> goToRoute({
  required StackRouter router,
  required PageRouteInfo route,
}) async {
  router.popUntilRoot();
  await router.replace(route);
}
