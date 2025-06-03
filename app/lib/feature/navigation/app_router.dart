import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../meal/page/meal_root_page.dart';
import '../meal/screen/meal_creating_screen.dart';
import '../meal/screen/meal_editing_screen.dart';
import '../meal/screen/meal_list_screen.dart';
import '../product/page/product_root_page.dart';
import '../product/screen/product_creating_screen.dart';
import '../product/screen/product_editing_screen.dart';
import '../product/screen/product_list_screen.dart';
import '../settings/screen/settings_screen.dart';
import '../training/page/training_root_page.dart';
import '../training/screen/exercise_statistics_screen.dart';
import '../training/screen/training_creating_screen.dart';
import '../training/screen/training_editing_screen.dart';
import '../training/screen/training_list_screen.dart';
import '../training/screen/training_process_screen.dart';
import '../user/screen/changing_weight_screen.dart';
import '../user/screen/home_screen.dart';
import '../user/screen/introduction_screen.dart';
import '../user/screen/weight_registration_screen.dart';
import './../root/page/root_page.dart';
import 'route_guard/user_presence_guard.dart';
import 'route_path.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({required this.userPresenceGuard});

  final UserPresenceGuard userPresenceGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RoutePath.introduction,
          page: IntroductionRoute.page,
        ),
        AutoRoute(
          path: RoutePath.weightRegistration,
          page: WeightRegistrationRoute.page,
        ),
        AutoRoute(
          path: RoutePath.root,
          page: RootRoute.page,
          guards: [userPresenceGuard],
          children: [
            RedirectRoute(
              path: '',
              redirectTo: RoutePath.home,
            ),
            AutoRoute(
              path: RoutePath.home,
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: RoutePath.changeWeight,
              page: ChangingWeightRoute.page,
            ),
            AutoRoute(
              path: RoutePath.settings,
              page: SettingsRoute.page,
            ),
            AutoRoute(
              path: RoutePath.product,
              page: ProductRootRoute.page,
              children: [
                RedirectRoute(
                  path: '',
                  redirectTo: RoutePath.product,
                ),
                AutoRoute(
                  path: RoutePath.product,
                  page: ProductListRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.createProduct,
                  page: ProductCreatingRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.editProduct,
                  page: ProductEditingRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: RoutePath.meal,
              page: MealRootRoute.page,
              children: [
                RedirectRoute(
                  path: '',
                  redirectTo: RoutePath.meal,
                ),
                AutoRoute(
                  path: RoutePath.meal,
                  page: MealListRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.createMeal,
                  page: MealCreatingRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.editMeal,
                  page: MealEditingRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: RoutePath.training,
              page: TrainingRootRoute.page,
              children: [
                RedirectRoute(
                  path: '',
                  redirectTo: RoutePath.training,
                ),
                AutoRoute(
                  path: RoutePath.training,
                  page: TrainingListRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.createTraining,
                  page: TrainingCreatingRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.editTraining,
                  page: TrainingEditingRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.exerciseStatistics,
                  page: ExerciseStatisticsRoute.page,
                ),
                AutoRoute(
                  path: RoutePath.doTraining,
                  page: TrainingProcessRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
}
