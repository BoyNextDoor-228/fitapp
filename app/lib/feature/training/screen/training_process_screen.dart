import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/bottom_sheet_provider.dart';
import '../../../tool/user_state_listener.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../navigation/app_router.dart';
import '../../timer/countdown_timer.dart';
import '../../user/bloc/user_bloc.dart';
import '../bloc/training_process/training_process_bloc.dart';
import '../widget/exercise_icon.dart';
import '../widget/exercise_list.dart';

@RoutePage()
class TrainingProcessScreen extends StatelessWidget {
  // Look at example: https://pub.dev/packages/auto_route#passing-arguments
  // ignore: use_key_in_widget_constructors
  TrainingProcessScreen({required this.training})
      : _trainingProcessBloc = TrainingProcessBloc(training: training);

  final Training training;
  final TrainingProcessBloc _trainingProcessBloc;
  late final UserBloc _userBloc;

  void _startTraining() {
    _trainingProcessBloc
        .add(TrainingProcessStarted(exercises: training.exercises));
  }

  void _updateTrainingProgression(Map<Exercise, bool> newProgress) {
    _trainingProcessBloc.add(
      TrainingProcessProgressionUpdated(
        exercisesProgress: newProgress,
      ),
    );
  }

  void _finishTraining() {
    _trainingProcessBloc.add(TrainingProcessCompleted());
    _userBloc.add(TrainingCompleted(trainingId: training.id));
  }

  @override
  Widget build(BuildContext context) {
    _userBloc = context.read<UserBloc>();
    final text = S.of(context);

    return FitAppScaffold(
      appBar: FitappAppbar.innerPage(
        title: text.training,
        backRoute: const TrainingListRoute(),
      ),
      drawer: const FitAppDrawer(),
      body: BlocProvider.value(
        value: _trainingProcessBloc,
        child: _TrainingProcess(
          training: training,
          startTraining: _startTraining,
          updateTrainingProgression: _updateTrainingProgression,
          finishTraining: _finishTraining,
        ),
      ),
    );
  }
}

class _TrainingProcess extends StatelessWidget {
  const _TrainingProcess({
    required this.training,
    required this.startTraining,
    required this.finishTraining,
    required this.updateTrainingProgression,
  });

  final Training training;
  final VoidCallback startTraining;
  final VoidCallback finishTraining;
  final void Function(Map<Exercise, bool> progression)
      updateTrainingProgression;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    training.title * 200,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () async => _showTrainingDescription(context),
                    icon: const Icon(Icons.info),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<TrainingProcessBloc, TrainingProcessState>(
                builder: (context, state) {
                  if (state is TrainingProcessInitial) {
                    return _TrainingProcessInitial(
                      exercises: training.exercises,
                      startTraining: startTraining,
                    );
                  }
                  if (state is TrainingProcessInProgress) {
                    return _TrainingProcessInProgress(
                      exercisesProcess: state.exercisesProgress,
                      canFinishTraining: state.canFinishTraining,
                      updateTrainingProgression: updateTrainingProgression,
                      finishTraining: finishTraining,
                    );
                  }
                  if (state is TrainingProcessComplete) {
                    return const _TrainingProcessComplete();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Future<void> _showTrainingDescription(BuildContext context) async {
    final text = S.of(context);

    await showVoidModalBottomSheet(
      context: context,
      headerText: text.trainingInformation,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text(training.title)),
            const Divider(),
            Center(child: Text(training.description ?? text.noDescription)),
          ],
        ),
      ),
    );
  }
}

class _TrainingProcessInitial extends StatelessWidget {
  const _TrainingProcessInitial({
    required this.exercises,
    required this.startTraining,
  });

  final List<Exercise> exercises;
  final VoidCallback startTraining;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Column(
      children: [
        Expanded(
          flex: 9,
          child: ExerciseList(
            exercises: exercises,
            exercisesAbsenceTitle: text.noExercisesYet,
            itemDimension: 300,
          ),
        ),
        Expanded(
          child: Center(
            child: OutlinedButton(
              onPressed: exercises.isNotEmpty ? startTraining : null,
              child: Text(text.startTraining),
            ),
          ),
        ),
      ],
    );
  }
}

class _TrainingProcessInProgress extends StatelessWidget {
  const _TrainingProcessInProgress({
    required this.exercisesProcess,
    required this.canFinishTraining,
    required this.updateTrainingProgression,
    required this.finishTraining,
  });

  final Map<Exercise, bool> exercisesProcess;
  final bool canFinishTraining;
  final void Function(Map<Exercise, bool> newProgress)
      updateTrainingProgression;
  final VoidCallback finishTraining;

  void _onCompletionToggled({
    required Exercise editedExercise,
    required bool isCompleted,
  }) {
    final newProgress = Map.of(exercisesProcess)
      ..update(editedExercise, (_) => isCompleted);
    updateTrainingProgression(newProgress);
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return BlocListener<UserBloc, UserState>(
      listener: userStateListener,
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: ListView.separated(
              itemCount: exercisesProcess.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, index) => _ExercisesProgressListItem(
                index: index + 1,
                exercise: exercisesProcess.keys.toList()[index],
                isCompleted: exercisesProcess.values.toList()[index],
                onToggle: _onCompletionToggled,
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: canFinishTraining ? finishTraining : null,
              child: Text(text.finishTraining),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrainingProcessComplete extends StatelessWidget {
  const _TrainingProcessComplete();

  @override
  Widget build(BuildContext context) => const Center(
        child: Text('OMAGAD, NICE COCK AWESOME BALLS'),
      );
}

class _ExercisesProgressListItem extends StatelessWidget {
  const _ExercisesProgressListItem({
    required this.exercise,
    required this.index,
    required this.isCompleted,
    required this.onToggle,
  });

  final int index;
  final bool isCompleted;
  final Exercise exercise;

  final void Function({
    required Exercise editedExercise,
    required bool isCompleted,
  }) onToggle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final itemHeight = MediaQuery.sizeOf(context).height * 0.2;
    final text = S.of(context);

    return SizedBox(
      width: double.infinity,
      height: itemHeight,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$index',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge,
                ),
                ExerciseIcon(size: 30, loadType: exercise.load.type),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  exercise.description ?? text.noDescription,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (exercise.load is Timer)
            Expanded(
              child: IconButton(
                onPressed: () async => _showTimerDialog(context),
                icon: const Icon(Icons.timer),
              ),
            ),
          Expanded(
            child: Checkbox(
              value: isCompleted,
              onChanged: (isCompleted) {
                onToggle(editedExercise: exercise, isCompleted: isCompleted!);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showTimerDialog(BuildContext context) async {
    final text = S.of(context);

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          exercise.title * 40,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        content: CountdownTimer(
          duration: (exercise.load as Timer).duration,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(text.finish),
          ),
        ],
      ),
    );
  }
}
