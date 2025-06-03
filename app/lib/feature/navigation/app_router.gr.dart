// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ChangingWeightScreen]
class ChangingWeightRoute extends PageRouteInfo<void> {
  const ChangingWeightRoute({List<PageRouteInfo>? children})
      : super(ChangingWeightRoute.name, initialChildren: children);

  static const String name = 'ChangingWeightRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangingWeightScreen();
    },
  );
}

/// generated route for
/// [ExerciseStatisticsScreen]
class ExerciseStatisticsRoute
    extends PageRouteInfo<ExerciseStatisticsRouteArgs> {
  ExerciseStatisticsRoute({
    required List<Exercise> exercises,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseStatisticsRoute.name,
          args: ExerciseStatisticsRouteArgs(exercises: exercises),
          initialChildren: children,
        );

  static const String name = 'ExerciseStatisticsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExerciseStatisticsRouteArgs>();
      return ExerciseStatisticsScreen(exercises: args.exercises);
    },
  );
}

class ExerciseStatisticsRouteArgs {
  const ExerciseStatisticsRouteArgs({required this.exercises});

  final List<Exercise> exercises;

  @override
  String toString() {
    return 'ExerciseStatisticsRouteArgs{exercises: $exercises}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [IntroductionScreen]
class IntroductionRoute extends PageRouteInfo<IntroductionRouteArgs> {
  IntroductionRoute({
    required VoidCallback onUserAppears,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          IntroductionRoute.name,
          args: IntroductionRouteArgs(onUserAppears: onUserAppears, key: key),
          initialChildren: children,
        );

  static const String name = 'IntroductionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<IntroductionRouteArgs>();
      return IntroductionScreen(
        onUserAppears: args.onUserAppears,
        key: args.key,
      );
    },
  );
}

class IntroductionRouteArgs {
  const IntroductionRouteArgs({required this.onUserAppears, this.key});

  final VoidCallback onUserAppears;

  final Key? key;

  @override
  String toString() {
    return 'IntroductionRouteArgs{onUserAppears: $onUserAppears, key: $key}';
  }
}

/// generated route for
/// [MealCreatingScreen]
class MealCreatingRoute extends PageRouteInfo<void> {
  const MealCreatingRoute({List<PageRouteInfo>? children})
      : super(MealCreatingRoute.name, initialChildren: children);

  static const String name = 'MealCreatingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MealCreatingScreen();
    },
  );
}

/// generated route for
/// [MealEditingScreen]
class MealEditingRoute extends PageRouteInfo<MealEditingRouteArgs> {
  MealEditingRoute({required Meal meal, List<PageRouteInfo>? children})
      : super(
          MealEditingRoute.name,
          args: MealEditingRouteArgs(meal: meal),
          initialChildren: children,
        );

  static const String name = 'MealEditingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MealEditingRouteArgs>();
      return MealEditingScreen(meal: args.meal);
    },
  );
}

class MealEditingRouteArgs {
  const MealEditingRouteArgs({required this.meal});

  final Meal meal;

  @override
  String toString() {
    return 'MealEditingRouteArgs{meal: $meal}';
  }
}

/// generated route for
/// [MealListScreen]
class MealListRoute extends PageRouteInfo<void> {
  const MealListRoute({List<PageRouteInfo>? children})
      : super(MealListRoute.name, initialChildren: children);

  static const String name = 'MealListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MealListScreen();
    },
  );
}

/// generated route for
/// [MealRootPage]
class MealRootRoute extends PageRouteInfo<void> {
  const MealRootRoute({List<PageRouteInfo>? children})
      : super(MealRootRoute.name, initialChildren: children);

  static const String name = 'MealRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MealRootPage();
    },
  );
}

/// generated route for
/// [ProductCreatingScreen]
class ProductCreatingRoute extends PageRouteInfo<void> {
  const ProductCreatingRoute({List<PageRouteInfo>? children})
      : super(ProductCreatingRoute.name, initialChildren: children);

  static const String name = 'ProductCreatingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductCreatingScreen();
    },
  );
}

/// generated route for
/// [ProductEditingScreen]
class ProductEditingRoute extends PageRouteInfo<ProductEditingRouteArgs> {
  ProductEditingRoute({required Product product, List<PageRouteInfo>? children})
      : super(
          ProductEditingRoute.name,
          args: ProductEditingRouteArgs(product: product),
          initialChildren: children,
        );

  static const String name = 'ProductEditingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductEditingRouteArgs>();
      return ProductEditingScreen(product: args.product);
    },
  );
}

class ProductEditingRouteArgs {
  const ProductEditingRouteArgs({required this.product});

  final Product product;

  @override
  String toString() {
    return 'ProductEditingRouteArgs{product: $product}';
  }
}

/// generated route for
/// [ProductListScreen]
class ProductListRoute extends PageRouteInfo<void> {
  const ProductListRoute({List<PageRouteInfo>? children})
      : super(ProductListRoute.name, initialChildren: children);

  static const String name = 'ProductListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductListScreen();
    },
  );
}

/// generated route for
/// [ProductRootPage]
class ProductRootRoute extends PageRouteInfo<void> {
  const ProductRootRoute({List<PageRouteInfo>? children})
      : super(ProductRootRoute.name, initialChildren: children);

  static const String name = 'ProductRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductRootPage();
    },
  );
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RootPage();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [TrainingCreatingScreen]
class TrainingCreatingRoute extends PageRouteInfo<void> {
  const TrainingCreatingRoute({List<PageRouteInfo>? children})
      : super(TrainingCreatingRoute.name, initialChildren: children);

  static const String name = 'TrainingCreatingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TrainingCreatingScreen();
    },
  );
}

/// generated route for
/// [TrainingEditingScreen]
class TrainingEditingRoute extends PageRouteInfo<TrainingEditingRouteArgs> {
  TrainingEditingRoute({
    required Training training,
    List<PageRouteInfo>? children,
  }) : super(
          TrainingEditingRoute.name,
          args: TrainingEditingRouteArgs(training: training),
          initialChildren: children,
        );

  static const String name = 'TrainingEditingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TrainingEditingRouteArgs>();
      return TrainingEditingScreen(training: args.training);
    },
  );
}

class TrainingEditingRouteArgs {
  const TrainingEditingRouteArgs({required this.training});

  final Training training;

  @override
  String toString() {
    return 'TrainingEditingRouteArgs{training: $training}';
  }
}

/// generated route for
/// [TrainingListScreen]
class TrainingListRoute extends PageRouteInfo<void> {
  const TrainingListRoute({List<PageRouteInfo>? children})
      : super(TrainingListRoute.name, initialChildren: children);

  static const String name = 'TrainingListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TrainingListScreen();
    },
  );
}

/// generated route for
/// [TrainingProcessScreen]
class TrainingProcessRoute extends PageRouteInfo<TrainingProcessRouteArgs> {
  TrainingProcessRoute({
    required Training training,
    List<PageRouteInfo>? children,
  }) : super(
          TrainingProcessRoute.name,
          args: TrainingProcessRouteArgs(training: training),
          initialChildren: children,
        );

  static const String name = 'TrainingProcessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TrainingProcessRouteArgs>();
      return TrainingProcessScreen(training: args.training);
    },
  );
}

class TrainingProcessRouteArgs {
  const TrainingProcessRouteArgs({required this.training});

  final Training training;

  @override
  String toString() {
    return 'TrainingProcessRouteArgs{training: $training}';
  }
}

/// generated route for
/// [TrainingRootPage]
class TrainingRootRoute extends PageRouteInfo<void> {
  const TrainingRootRoute({List<PageRouteInfo>? children})
      : super(TrainingRootRoute.name, initialChildren: children);

  static const String name = 'TrainingRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TrainingRootPage();
    },
  );
}

/// generated route for
/// [WeightRegistrationScreen]
class WeightRegistrationRoute
    extends PageRouteInfo<WeightRegistrationRouteArgs> {
  WeightRegistrationRoute({
    required VoidCallback onUserAppears,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WeightRegistrationRoute.name,
          args: WeightRegistrationRouteArgs(
            onUserAppears: onUserAppears,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WeightRegistrationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeightRegistrationRouteArgs>();
      return WeightRegistrationScreen(
        onUserAppears: args.onUserAppears,
        key: args.key,
      );
    },
  );
}

class WeightRegistrationRouteArgs {
  const WeightRegistrationRouteArgs({required this.onUserAppears, this.key});

  final VoidCallback onUserAppears;

  final Key? key;

  @override
  String toString() {
    return 'WeightRegistrationRouteArgs{onUserAppears: $onUserAppears, key: $key}';
  }
}
