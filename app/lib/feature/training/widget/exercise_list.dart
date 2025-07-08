import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid_value.dart';

import 'exercise_list_item.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({
    required this.exercises,
    required this.exercisesAbsenceTitle,
    required this.itemDimension,
    this.scrollDirection = Axis.horizontal,
    super.key,
  })  : _isEditable = false,
        onEdited = null,
        onDeletePressed = null;

  const ExerciseList.editable({
    required this.exercises,
    required this.onDeletePressed,
    required this.onEdited,
    required this.exercisesAbsenceTitle,
    required this.itemDimension,
    this.scrollDirection = Axis.horizontal,
    super.key,
  }) : _isEditable = true;

  final Axis scrollDirection;
  final List<Exercise> exercises;
  final void Function(UuidValue exerciseId)? onDeletePressed;
  final void Function(Exercise newExercise)? onEdited;
  final String exercisesAbsenceTitle;
  final bool _isEditable;
  final double itemDimension;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return exercises.isEmpty
        ? Center(
            child: Text(
              exercisesAbsenceTitle,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: scrollDirection,
            itemCount: exercises.length,
            itemBuilder: (context, index) => _isEditable
                ? ExerciseListItem.editable(
                    exercise: exercises[index],
                    onDeletePressed: () =>
                        onDeletePressed!(exercises[index].id),
                    onEditPressed: onEdited,
                    itemDimension: itemDimension,
                  )
                : ExerciseListItem(
                    exercise: exercises[index],
                    itemDimension: itemDimension,
                  ),
          );
  }
}
