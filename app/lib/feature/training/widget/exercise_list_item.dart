import 'dart:async';

import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/bottom_sheet_provider.dart';
import '../../../tool/exercise_load_to_text.dart';
import '../../../tool/show_deletion_dialog.dart';
import 'exercise_icon.dart';
import 'form/exercise_form.dart';

class ExerciseListItem extends StatelessWidget {
  const ExerciseListItem({
    required this.exercise,
    required this.itemDimension,
    super.key,
  })  : _isEditable = false,
        onEditPressed = null,
        onDeletePressed = null;

  const ExerciseListItem.editable({
    required this.exercise,
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.itemDimension,
    super.key,
  }) : _isEditable = true;

  final Exercise exercise;

  final VoidCallback? onDeletePressed;
  final void Function(Exercise newExercise)? onEditPressed;

  final bool _isEditable;
  final double itemDimension;

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          shadowColor: Theme.of(context).colorScheme.inversePrimary,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox.square(
              dimension: itemDimension,
              child: Column(
                spacing: 10,
                children: [
                  Expanded(
                    flex: 2,
                    child: _Header(
                      exercise: exercise,
                      isEditable: _isEditable,
                      onDeletePressed: onDeletePressed,
                      onEditPressed: onEditPressed,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: _Content(exercise: exercise),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _Content extends StatelessWidget {
  const _Content({
    required this.exercise,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final text = S.of(context);

    return Column(
      children: [
        Expanded(
          child: Text(
            exercise.description ?? text.noDescription,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ExerciseIcon(size: 60, loadType: exercise.load.type),
        ),
        Expanded(
          child: Center(
            child: Text(
              turnExerciseLoadToText(exercise.sets, exercise.load, text),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.exercise,
    required this.isEditable,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  final Exercise exercise;
  final bool isEditable;

  final VoidCallback? onDeletePressed;
  final void Function(Exercise newExercise)? onEditPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Text(
            exercise.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (isEditable)
          _CardMenuButtons(
            exercise: exercise,
            onDeletePressed: onDeletePressed!,
            onEditPressed: onEditPressed!,
          ),
      ],
    );
  }
}

class _CardMenuButtons extends StatelessWidget {
  const _CardMenuButtons({
    required this.exercise,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  final Exercise exercise;

  final VoidCallback onDeletePressed;
  final void Function(Exercise newExercise) onEditPressed;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuEntry<FutureOr<void>>>[
        PopupMenuItem(
          onTap: () async {
            await _openExerciseEditingModal(context);
          },
          child: Text(text.edit),
        ),
        PopupMenuItem(
          child: Text(text.delete),
          onTap: () async => showDeletionDialog(
            context: context,
            onConfirmed: onDeletePressed,
            deleteWhat: S.of(context).exercise,
          ),
        ),
      ],
    );
  }

  Future<void> _openExerciseEditingModal(BuildContext context) async {
    final text = S.of(context);

    await showVoidModalBottomSheet(
      context: context,
      headerText: text.exerciseEditing,
      content: ExerciseForm(
        initialExercise: exercise,
        onFormApply: onEditPressed,
        actionButtonText: text.saveChanges,
      ),
    );
  }
}
