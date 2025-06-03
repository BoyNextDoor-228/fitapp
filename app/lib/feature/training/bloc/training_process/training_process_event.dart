part of 'training_process_bloc.dart';

sealed class TrainingProcessEvent {
  const TrainingProcessEvent();
}

final class TrainingProcessStarted extends TrainingProcessEvent {
  TrainingProcessStarted({required this.exercises});

  final List<Exercise> exercises;
}

final class TrainingProcessProgressionUpdated extends TrainingProcessEvent {
  TrainingProcessProgressionUpdated({
    required this.exercisesProgress,
  });

  final Map<Exercise, bool> exercisesProgress;
}

final class TrainingProcessCompleted extends TrainingProcessEvent {
  TrainingProcessCompleted();
}
