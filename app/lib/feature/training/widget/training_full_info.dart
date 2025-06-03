import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../navigation/app_router.dart';
import 'exercise_list.dart';

class TrainingFullInfo extends StatelessWidget {
  const TrainingFullInfo({
    required this.training,
    super.key,
  });

  final Training training;

  @override
  Widget build(BuildContext context) {
    final exerciseListHeight = MediaQuery.sizeOf(context).height * 0.4;
    final text = S.of(context);

    Future<void> goToTrainingProcessScreen() async {
      context.router.pop();
      await context.router.navigate(
        TrainingProcessRoute(training: training),
      );
    }

    Future<void> goToExerciseStatisticsScreen() async {
      context.router.pop();
      await context.router.navigate(
        ExerciseStatisticsRoute(exercises: training.exercises),
      );
    }

    return SingleChildScrollView(
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            training.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            training.description ?? text.noDescription,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: exerciseListHeight,
            width: double.infinity,
            child: ExerciseList(
              exercises: training.exercises,
              exercisesAbsenceTitle: text.noExercisesYet,
              itemDimension: exerciseListHeight * 0.8,
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
