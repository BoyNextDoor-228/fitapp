import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

class ExerciseIcon extends StatelessWidget {
  const ExerciseIcon({
    required this.loadType,
    this.size,
    super.key,
  });

  final ExerciseLoadType loadType;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (loadType == ExerciseLoadType.timer) {
      return Icon(
        Icons.timer_outlined,
        size: size,
      );
    }

    if (loadType == ExerciseLoadType.repetition) {
      return Icon(
        Icons.onetwothree,
        size: size == null ? size : size! * 1.2,
      );
    }

    return Icon(
      Icons.question_mark,
      size: size,
    );
  }
}
