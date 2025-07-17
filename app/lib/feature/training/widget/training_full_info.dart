import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/route_provider.dart';
import '../../navigation/app_router.dart';
import 'exercise_list.dart';

class TrainingFullInfo extends StatelessWidget {
  /// Creates a widget, that displays full information about [training].
  ///
  /// Displays training title, description (if present), list of exercises,
  /// 'Show statistics' and 'Start training' buttons.
  const TrainingFullInfo({
    required this.training,
    super.key,
  });

  final Training training;

  @override
  Widget build(BuildContext context) {
    final exerciseListHeight = MediaQuery.sizeOf(context).shortestSide;
    final textTheme = Theme.of(context).textTheme;
    final router = context.router;

    final text = S.of(context);

    Future<void> goToTrainingProcessScreen() async => goToRoute(
          router: router,
          route: TrainingProcessRoute(training: training),
        );

    Future<void> goToExerciseStatisticsScreen() async => goToRoute(
          router: router,
          route: ExerciseStatisticsRoute(exercises: training.exercises),
        );

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            training.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: textTheme.titleLarge,
          ),
          Text(
            training.description ?? text.noDescription,
            style: textTheme.titleMedium,
          ),
          SizedBox(
            height: exerciseListHeight * 0.8,
            width: double.infinity,
            child: ExerciseList(
              exercises: training.exercises,
              exercisesAbsenceTitle: text.noExercisesYet,
              itemDimension: exerciseListHeight * 0.7,
            ),
          ),
          if (training.exercises.isEmpty)
            Center(
              child: Text(text.addSomeExercisesToStartThisTraining),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: goToExerciseStatisticsScreen,
                    child: Text(
                      text.watchStatistics,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: goToTrainingProcessScreen,
                    child: Text(
                      text.startTraining,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
