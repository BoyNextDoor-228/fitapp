part of 'training_process_bloc.dart';

sealed class TrainingProcessState extends Equatable {
  const TrainingProcessState({required this.exercisesProgress});

  final Map<Exercise, bool> exercisesProgress;

  @override
  List<Object?> get props => [exercisesProgress];
}

class TrainingProcessInitial extends TrainingProcessState {
  const TrainingProcessInitial() : super(exercisesProgress: const {});
}

class TrainingProcessInProgress extends TrainingProcessState {
  TrainingProcessInProgress({required super.exercisesProgress})
      : canFinishTraining = exercisesProgress.values.every(
          (isFinished) => isFinished,
        );

  final bool canFinishTraining;
}

class TrainingProcessComplete extends TrainingProcessState {
  const TrainingProcessComplete() : super(exercisesProgress: const {});
}
