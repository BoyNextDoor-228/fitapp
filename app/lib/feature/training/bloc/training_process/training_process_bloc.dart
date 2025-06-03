import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitapp_domain/domain.dart';

part 'training_process_event.dart';
part 'training_process_state.dart';

class TrainingProcessBloc
    extends Bloc<TrainingProcessEvent, TrainingProcessState> {
  TrainingProcessBloc({
    required this.training,
  }) : super(const TrainingProcessInitial()) {
    on<TrainingProcessStarted>(_onTrainingStarted);
    on<TrainingProcessProgressionUpdated>(_onTrainingProcessProgressionUpdated);
    on<TrainingProcessCompleted>(_onTrainingProcessCompleted);
  }

  //final UserService _userService = GetIt.I<IAppScope>().userService;
  final Training training;

  void _onTrainingStarted(
    TrainingProcessStarted event,
    Emitter<TrainingProcessState> emit,
  ) {
    final initialExercisesProgress = Map<Exercise, bool>.fromIterable(
      event.exercises,
      value: (_) => false,
    );

    emit(
      TrainingProcessInProgress(exercisesProgress: initialExercisesProgress),
    );
  }

  void _onTrainingProcessProgressionUpdated(
    TrainingProcessProgressionUpdated event,
    Emitter<TrainingProcessState> emit,
  ) {
    emit(
      TrainingProcessInProgress(exercisesProgress: event.exercisesProgress),
    );
  }

  Future<void> _onTrainingProcessCompleted(
    TrainingProcessCompleted event,
    Emitter<TrainingProcessState> emit,
  ) async {
    // await _userService.completeTraining(
    //   trainingId: training.id,
    //   completedAt: DateTime.now(),
    // );

    emit(const TrainingProcessComplete());
    await close();
  }
}
