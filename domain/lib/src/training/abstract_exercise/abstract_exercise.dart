import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../domain.dart';
import '../../utils/uuid_value_converter.dart';

part 'abstract_exercise.g.dart';
part 'abstract_exercise.freezed.dart';

@freezed
class AbstractExercise with _$AbstractExercise {
  const factory AbstractExercise._({
    @UuidValueConverter() required UuidValue id,
    required String title,
    required String? description,
    required ExerciseLoadType loadType,
  }) = _AbstractExercise;

  factory AbstractExercise.withReps({
    required String title,
    required String? description,
  }) =>
      AbstractExercise._(
        id: UuidValue.fromString(const Uuid().v1()),
        title: title,
        description: description,
        loadType: ExerciseLoadType.repetition,
      );

  factory AbstractExercise.withTimer({
    required String title,
    required String? description,
  }) =>
      AbstractExercise._(
        id: UuidValue.fromString(const Uuid().v1()),
        title: title,
        description: description,
        loadType: ExerciseLoadType.timer,
      );

  factory AbstractExercise.fromExercise(Exercise exercise) =>
      AbstractExercise._(
        id: exercise.id,
        title: exercise.title,
        description: exercise.description,
        loadType: exercise.load.type,
      );

  factory AbstractExercise.fromJson(Map<String, dynamic> json) =>
      _$AbstractExerciseFromJson(json);
}
