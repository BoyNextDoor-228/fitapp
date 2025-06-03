import 'package:auto_route/auto_route.dart';

import '../../../service/user_service.dart';
import '../app_router.dart';

class UserPresenceGuard extends AutoRouteGuard {
  const UserPresenceGuard({required UserService userService})
      : _userService = userService;

  final UserService _userService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isUserPresented = _userService.user != null;

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
        // WeightRegistrationRoute(
        //   onUserAppears: () {
        //     resolver.next();
        //     router.removeLast();
        //   },
        // ),
      );
    }
  }
}
