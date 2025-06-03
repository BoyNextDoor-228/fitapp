import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid_value.dart';

import 'exercise_list_item.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({
    required this.exercises,
    required this.exercisesAbsenceTitle,
    required this.itemDimension,
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
    super.key,
  }) : _isEditable = true;

  final List<Exercise> exercises;
  final void Function(UuidValue exerciseId)? onDeletePressed;
  final void Function(Exercise newExercise)? onEdited;
  final String exercisesAbsenceTitle;
  final bool _isEditable;
  final double itemDimension;

  @override
  Widget build(BuildContext context) => exercises.isEmpty
      ? Center(child: Text(exercisesAbsenceTitle))
      : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: exercises.length,
          itemBuilder: (context, index) => _isEditable
              ? ExerciseListItem.editable(
                  exercise: exercises[index],
                  onDeletePressed: () => onDeletePressed!(exercises[index].id),
                  onEditPressed: onEdited,
                  itemDimension: itemDimension,
                )
              : ExerciseListItem(
                  exercise: exercises[index],
                  itemDimension: itemDimension,
                ),
        );
}
