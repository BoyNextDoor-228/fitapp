import 'package:auto_route/auto_route.dart';

import '../app_router.dart';

class UserPresenceGuard extends AutoRouteGuard {
  const UserPresenceGuard({required this.isUserPresented});

  final bool isUserPresented;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isUserPresented) {
      resolver.next();
    } else {
      //ignore: discarded_futures
      resolver.redirectUntil(
        IntroductionRoute(
          onUserAppears: () {
            resolver.next();
            router.removeLast();
          },
        ),
      );
    }
  }
}
