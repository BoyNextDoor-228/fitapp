import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid_value.dart';

import 'exercise_list_item.dart';

class ExerciseList extends StatelessWidget {
  /// Creates scrollable list of [exercises].
  ///
  /// [exercisesAbsenceTitle] is a message, that will be shown instead of list,
  /// if [exercises] are absent.
  /// [itemDimension] is a dimension of a single item ([Card]) in list.
  /// [scrollDirection] is teh [Axis] along which the scroll view's offset
  /// increases. Default is [Axis.horizontal].
  const ExerciseList({
    required this.exercises,
    required this.exercisesAbsenceTitle,
    required this.itemDimension,
    this.scrollDirection = Axis.horizontal,
    super.key,
  })  : _isEditable = false,
        onEdited = null,
        onDelete = null;

  /// Creates scrollable and editable list of [exercises].
  ///
  /// 'Editable' means each list item may be deleted or edited.
  /// [onEdited] is a callback, which implements editing of an exercise.
  /// [onDelete] is a callback, which implements deletion of an exercise.
  /// [exercisesAbsenceTitle] is a message, that will be shown instead of list,
  /// if [exercises] are absent.
  /// [itemDimension] is a dimension of a single item ([Card]) in list.
  /// [scrollDirection] is teh [Axis] along which the scroll view's offset
  /// increases. Default is [Axis.horizontal].
  const ExerciseList.editable({
    required this.exercises,
    required this.onDelete,
    required this.onEdited,
    required this.exercisesAbsenceTitle,
    required this.itemDimension,
    this.scrollDirection = Axis.horizontal,
    super.key,
  }) : _isEditable = true;

  final Axis scrollDirection;
  final List<Exercise> exercises;
  final void Function(UuidValue exerciseId)? onDelete;
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
                    onDelete: () => onDelete!(exercises[index].id),
                    onEdit: onEdited,
                    itemDimension: itemDimension,
                  )
                : ExerciseListItem(
                    exercise: exercises[index],
                    itemDimension: itemDimension,
                  ),
          );
  }
}
