import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/training_process/training_process_bloc.dart';
import './training_process_in_progress.dart';
import './training_process_initial.dart';
import 'training_process_complete.dart';

class TrainingProcess extends StatelessWidget {
  const TrainingProcess({
    required this.training,
    required this.startTraining,
    required this.finishTraining,
    required this.updateTrainingProgression,
    super.key,
  });

  final Training training;
  final VoidCallback startTraining;
  final VoidCallback finishTraining;
  final void Function(Map<Exercise, bool> progression)
      updateTrainingProgression;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TrainingProcessBloc, TrainingProcessState>(
        builder: (context, state) {
          if (state is TrainingProcessInitial) {
            return TrainingProcessInitialWidget(
              exercises: training.exercises,
              startTraining: startTraining,
            );
          }
          if (state is TrainingProcessInProgress) {
            return TrainingProcessInProgressWidget(
              exercisesProcess: state.exercisesProgress,
              canFinishTraining: state.canFinishTraining,
              updateTrainingProgression: updateTrainingProgression,
              finishTraining: finishTraining,
            );
          }
          if (state is TrainingProcessComplete) {
            return TrainingProcessCompleteWidget(
              trainingId: training.id,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
}
