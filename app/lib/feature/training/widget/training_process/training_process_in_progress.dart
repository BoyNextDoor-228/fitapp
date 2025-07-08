import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/user_state_listener.dart';
import '../../../app/widget/page_view_control_button.dart';
import '../../../user/bloc/user_bloc.dart';
import 'exercise_progress_list_item.dart';

class TrainingProcessInProgressWidget extends StatefulWidget {
  const TrainingProcessInProgressWidget({
    required this.exercisesProcess,
    required this.canFinishTraining,
    required this.updateTrainingProgression,
    required this.finishTraining,
    super.key,
  });

  final Map<Exercise, bool> exercisesProcess;
  final bool canFinishTraining;
  final void Function(Map<Exercise, bool> newProgress)
      updateTrainingProgression;
  final VoidCallback finishTraining;

  @override
  State<TrainingProcessInProgressWidget> createState() =>
      TrainingProcessInProgressWidgetState();
}

class TrainingProcessInProgressWidgetState
    extends State<TrainingProcessInProgressWidget> {
  final _pageViewController = PageController();

  int _currentPageIndex = 0;

  final _pageTransitionDuration = Durations.long2;
  final _pageTransitionCurve = Curves.fastLinearToSlowEaseIn;

  Future<void> _goToNextPage() async => _pageViewController.nextPage(
        duration: _pageTransitionDuration,
        curve: _pageTransitionCurve,
      );

  Future<void> _goToPreviousPage() async => _pageViewController.previousPage(
        duration: _pageTransitionDuration,
        curve: _pageTransitionCurve,
      );

  void _setPageCurrentIndex(int newIndex) => setState(() {
        _currentPageIndex = newIndex;
      });

  void _onCompletionToggled({
    required Exercise editedExercise,
    required bool isCompleted,
  }) {
    final newProgress = Map.of(widget.exercisesProcess)
      ..update(editedExercise, (_) => isCompleted);
    widget.updateTrainingProgression(newProgress);
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return BlocListener<UserBloc, UserState>(
      listener: userStateListener,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageViewController,
              onPageChanged: _setPageCurrentIndex,
              itemCount: widget.exercisesProcess.length,
              itemBuilder: (_, index) => ExercisesProgressListItem(
                index: index + 1,
                exercise: widget.exercisesProcess.keys.toList()[index],
                isCompleted: widget.exercisesProcess.values.toList()[index],
                onToggle: _onCompletionToggled,
                isLandscape: isLandscape,
              ),
            ),
          ),
          Row(
            children: [
              PageViewControlButton(
                icon: const Icon(Icons.chevron_left),
                onTap: _goToPreviousPage,
                isActive: _currentPageIndex != 0,
              ),
              Expanded(
                child: TextButton(
                  onPressed:
                      widget.canFinishTraining ? widget.finishTraining : null,
                  child: Text(text.finishTraining),
                ),
              ),
              PageViewControlButton(
                icon: const Icon(Icons.chevron_right),
                onTap: _goToNextPage,
                isActive:
                    _currentPageIndex != widget.exercisesProcess.length - 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
