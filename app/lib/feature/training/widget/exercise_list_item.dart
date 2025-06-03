import 'dart:async';

import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/bottom_sheet_provider.dart';
import '../../../tool/exercise_load_to_text.dart';
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
    final text = S.of(context);

    return Column(
      children: [
        Expanded(
          child: Text(
            exercise.description ?? text.noDescription,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
              style: Theme.of(context).textTheme.titleLarge,
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
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 8,
            child: Text(
              exercise.title * 100,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (isEditable)
            Expanded(
              child: _CardMenuButtons(
                exercise: exercise,
                onDeletePressed: onDeletePressed!,
                onEditPressed: onEditPressed!,
              ),
            ),
        ],
      );
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
          // TODO(BoyNextDoor-228): Implement as extension.
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(text.deletion),
                content: Text(
                  text.areYouSureYouWantToDeleteThisObject('exercise'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(text.no),
                  ),
                  TextButton(
                    onPressed: () {
                      onDeletePressed();
                      Navigator.pop(context);
                    },
                    child: Text(text.yes),
                  ),
                ],
              ),
            );
          },
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
