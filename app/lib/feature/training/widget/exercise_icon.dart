import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

class ExerciseIcon extends StatelessWidget {
  /// Creates an [Icon], which represents [ExerciseLoadType].
  ///
  /// [loadType] is the type, which icon depends on.
  /// [size] is the size of icon. Default is [Null].
  const ExerciseIcon({
    required this.loadType,
    this.size,
    super.key,
  });

  final ExerciseLoadType loadType;
  final double? size;

  @override
  Widget build(BuildContext context) {
    switch (loadType) {
      case ExerciseLoadType.timer:
        return Icon(
          Icons.timer_outlined,
          size: size,
        );
      case ExerciseLoadType.repetition:
        return Icon(
          Icons.onetwothree,
          // Multiplier is needed here, as this icon is visually smaller itself,
          // than other icons with the same size.
          size: size == null ? size : size! * 1.2,
        );
    }
  }
}
