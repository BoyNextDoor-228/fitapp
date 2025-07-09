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
    required this.onTrainingStarted,
    required this.onTrainingFinished,
    required this.onTrainingProgressionUpdated,
    super.key,
  });

  final Training training;
  final VoidCallback onTrainingStarted;
  final VoidCallback onTrainingFinished;
  final void Function(Map<Exercise, bool> progression)
      onTrainingProgressionUpdated;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<TrainingProcessBloc, TrainingProcessState>(
        builder: (context, state) {
          if (state is TrainingProcessInitial) {
            return TrainingProcessInitialWidget(
              exercises: training.exercises,
              startTraining: onTrainingStarted,
            );
          }
          if (state is TrainingProcessInProgress) {
            return TrainingProcessInProgressWidget(
              exercisesProcess: state.exercisesProgress,
              canFinishTraining: state.canFinishTraining,
              updateTrainingProgression: onTrainingProgressionUpdated,
              finishTraining: onTrainingFinished,
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
