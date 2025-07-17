import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../exercise_list.dart';

class TrainingProcessInitialWidget extends StatelessWidget {
  /// Creates a widget, which is shown before training process just to show
  /// [exercises] user will do.
  ///
  /// [startTraining] is a callback, which is called, when user taps
  /// 'start training' button.
  const TrainingProcessInitialWidget({
    required this.exercises,
    required this.startTraining,
    super.key,
  });

  final List<Exercise> exercises;
  final VoidCallback startTraining;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;

    final height = MediaQuery.sizeOf(context).shortestSide;

    return Column(
      spacing: 5,
      children: [
        Expanded(
          child: ExerciseList(
            exercises: exercises,
            exercisesAbsenceTitle: text.noExercisesYet,
            itemDimension: height,
            scrollDirection: isPortrait ? Axis.vertical : Axis.horizontal,
          ),
        ),
        Center(
          child: OutlinedButton(
            onPressed: exercises.isNotEmpty ? startTraining : null,
            child: Text(text.startTraining),
          ),
        ),
      ],
    );
  }
}
