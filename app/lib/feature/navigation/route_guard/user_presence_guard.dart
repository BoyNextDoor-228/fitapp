import 'package:auto_route/auto_route.dart';

import '../app_router.dart';

class UserPresenceGuard extends AutoRouteGuard {
  /// Prevents from navigation, if user is not presented.
  const UserPresenceGuard({required this.isUserPresented});

  final bool isUserPresented;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isUserPresented) {
      resolver.next();
    } else {
      // If no user presented, we have to create one by redirecting IRL user to
      // IntroductionScreen
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
