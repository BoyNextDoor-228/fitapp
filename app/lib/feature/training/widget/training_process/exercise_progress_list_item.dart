import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/bottom_sheet_provider.dart';
import '../../../../tool/exercise_load_to_text.dart';
import '../../../timer/countdown_timer.dart';
import '../exercise_icon.dart';

class ExercisesProgressListItem extends StatelessWidget {
  const ExercisesProgressListItem({
    required this.exercise,
    required this.index,
    required this.isCompleted,
    required this.onToggle,
    this.isLandscape = false,
    super.key,
  });

  final int index;
  final bool isCompleted;
  final bool isLandscape;
  final Exercise exercise;

  final void Function({
    required Exercise editedExercise,
    required bool isCompleted,
  }) onToggle;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final textTheme = Theme.of(context).textTheme.headlineSmall;

    final colorScheme = Theme.of(context).colorScheme;

    final scaleFactor =
        MediaQuery.textScalerOf(context).scale(textTheme!.height!);

    final backgroundColor = isCompleted
        ? colorScheme.primary.withValues(alpha: 0.25)
        : colorScheme.onPrimary.withValues(alpha: 0.25);

    final indexWidget = Text(
      '$index',
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textTheme.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );

    final exerciseTitleWidget = Text(
      exercise.title,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textTheme,
    );

    final showExerciseDescriptionButton = IconButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.centerRight,
      icon: const Icon(Icons.info),
      onPressed: () async => _showExerciseDescription(context),
    );

    final exerciseIcon = ExerciseIcon(
      size: 50 * scaleFactor,
      loadType: exercise.load.type,
    );

    final exerciseLoadTextWidget = Text(
      turnExerciseLoadToText(exercise.sets, exercise.load, text),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textTheme,
    );

    final timerButtonWidget = InkWell(
      onTap: () async => _showTimerDialog(context),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer),
          Text(
            text.tapToOpenTimer,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme,
          ),
        ],
      ),
    );

    final exerciseCompletionCheckbox = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isCompleted,
          onChanged: (isCompleted) {
            onToggle(
              editedExercise: exercise,
              isCompleted: isCompleted!,
            );
          },
        ),
        Text(
          textAlign: TextAlign.center,
          text.markAsCompleted,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme,
        ),
      ],
    );

    return _ExerciseProgressListItemOrientated(
      isLandscape: isLandscape,
      backgroundColor: backgroundColor,
      indexWidget: indexWidget,
      exerciseTitleWidget: exerciseTitleWidget,
      showExerciseDescriptionButton: showExerciseDescriptionButton,
      exerciseIcon: exerciseIcon,
      exerciseLoadTextWidget: exerciseLoadTextWidget,
      timerButtonWidget: exercise.load is Timer ? timerButtonWidget : null,
      exerciseCompletionCheckbox: exerciseCompletionCheckbox,
    );
  }

  Future<void> _showExerciseDescription(BuildContext context) async {
    final text = S.of(context);

    await showVoidModalBottomSheet(
      context: context,
      headerText: text.exerciseInformation,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text(exercise.title)),
            const Divider(),
            Center(child: Text(exercise.description ?? text.noDescription)),
          ],
        ),
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
          exercise.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        content: CountdownTimer(
          duration: (exercise.load as Timer).duration,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => context.router.pop(),
            child: Text(text.finish),
          ),
        ],
      ),
    );
  }
}

class _ExerciseProgressListItemOrientated extends StatelessWidget {
  _ExerciseProgressListItemOrientated({
    required this.backgroundColor,
    required this.indexWidget,
    required this.exerciseTitleWidget,
    required this.showExerciseDescriptionButton,
    required this.exerciseIcon,
    required this.exerciseLoadTextWidget,
    required this.exerciseCompletionCheckbox,
    required this.isLandscape,
    this.timerButtonWidget,
  })  : portraitOrientatedContent = [
          Expanded(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                exerciseIcon,
                exerciseLoadTextWidget,
              ],
            ),
          ),
          if (timerButtonWidget != null) timerButtonWidget,
          exerciseCompletionCheckbox,
        ],
        landscapeOrientatedContent = [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: exerciseIcon),
                      exerciseLoadTextWidget,
                    ],
                  ),
                ),
                const VerticalDivider(
                  thickness: 0.25,
                ),
                Expanded(
                  child: Column(
                    children: [
                      if (timerButtonWidget != null)
                        Expanded(child: timerButtonWidget),
                      Expanded(child: exerciseCompletionCheckbox),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ];

  final bool isLandscape;
  final Color backgroundColor;
  final Widget indexWidget;
  final Widget exerciseTitleWidget;
  final Widget showExerciseDescriptionButton;
  final Widget exerciseIcon;
  final Widget exerciseLoadTextWidget;
  final Widget exerciseCompletionCheckbox;
  final Widget? timerButtonWidget;

  late final List<Widget> portraitOrientatedContent;
  late final List<Widget> landscapeOrientatedContent;

  @override
  Widget build(BuildContext context) => Card(
        color: backgroundColor,
        elevation: 10,
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Expanded(child: indexWidget),
                Expanded(
                  flex: 4,
                  child: exerciseTitleWidget,
                ),
                showExerciseDescriptionButton,
              ],
            ),
            if (isLandscape)
              ...landscapeOrientatedContent
            else
              ...portraitOrientatedContent,
          ],
        ),
      );
}
