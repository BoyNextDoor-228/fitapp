import 'dart:async';

import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/show_deletion_dialog.dart';
import 'exercise_icon.dart';

class TrainingListItem extends StatelessWidget {
  /// Creates a representation of a [training] list item.
  ///
  /// [index] is an order number of the training list item.
  /// [cardHeight] is a height of the item ([Card]).
  /// [onEdit] is a callback, which implements editing of a training.
  /// [onDelete] is a callback, which implements deletion of a training.
  const TrainingListItem({
    required this.training,
    required this.index,
    required this.cardHeight,
    required this.onDelete,
    required this.onEdit,
    super.key,
  });

  final Training training;
  final double cardHeight;
  final int index;

  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: double.infinity,
            height: cardHeight,
            child: Column(
              children: [
                Expanded(
                  child: _Header(
                    index: index,
                    training: training,
                    onDeletePressed: onDelete,
                    onEditPressed: onEdit,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _Content(
                    training: training,
                    exerciseCardDimension: cardHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _Header extends StatelessWidget {
  const _Header({
    required this.index,
    required this.training,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  final int index;
  final Training training;

  final VoidCallback onDeletePressed;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$index',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(
              training.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: _CardMenuButtons(
              onDeletePressed: onDeletePressed,
              onEditPressed: onEditPressed,
            ),
          ),
        ],
      );
}

class _Content extends StatelessWidget {
  const _Content({
    required this.training,
    required this.exerciseCardDimension,
  });

  final Training training;
  final double exerciseCardDimension;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          training.description ?? text.noDescription,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(
          child: _ExercisesCarousel(
            exercises: training.exercises,
            cardDimension: exerciseCardDimension,
          ),
        ),
      ],
    );
  }
}

class _ExercisesCarousel extends StatelessWidget {
  const _ExercisesCarousel({
    required this.exercises,
    required this.cardDimension,
  });

  final List<Exercise> exercises;
  final double cardDimension;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return exercises.isEmpty
        ? Center(
            child: Text(text.noExercisesYet),
          )
        : ListView.builder(
            itemCount: exercises.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => _ExerciseListMicroItem(
              exercise: exercises[index],
              cardDimension: cardDimension,
            ),
          );
  }
}

class _ExerciseListMicroItem extends StatelessWidget {
  const _ExerciseListMicroItem({
    required this.exercise,
    required this.cardDimension,
  });

  final Exercise exercise;
  final double cardDimension;

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox.square(
              dimension: cardDimension,
              child: Column(
                children: [
                  Expanded(
                    child: ExerciseIcon(
                      size: 40,
                      loadType: exercise.load.type,
                    ),
                  ),
                  Text(
                    exercise.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _CardMenuButtons extends StatelessWidget {
  const _CardMenuButtons({
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  final VoidCallback onDeletePressed;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuEntry<FutureOr<void>>>[
        PopupMenuItem(
          onTap: () async => onEditPressed(),
          child: Text(text.edit),
        ),
        PopupMenuItem(
          child: Text(text.delete),
          onTap: () async => showDeletionDialog(
            context: context,
            onConfirmed: onDeletePressed,
            deleteWhat: text.training,
          ),
        ),
      ],
    );
  }
}
