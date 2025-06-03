import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../domain.dart';
import '../../utils/exercise_load_converter.dart';
import '../../utils/uuid_value_converter.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
class Exercise with _$Exercise {
  factory Exercise({
    required String title,
    required String? description,
    required int sets,
    @ExerciseLoadConverter() required ExerciseLoad load,
    required List<ExerciseStatistic> statistics,
    @UuidValueConverter() UuidValue? id,
  }) =>
      Exercise._(
        id: id ?? UuidValue.fromString(const Uuid().v1()),
        title: title,
        description: description,
        sets: sets,
        load: load,
        statistics: statistics,
      );

  factory Exercise.empty({
    ExerciseLoadType? loadType,
  }) {
    late final ExerciseLoad load;

    if (loadType == ExerciseLoadType.repetition || loadType == null) {
      load = const Repetition(repsAmount: 0);
    }

    if (loadType == ExerciseLoadType.timer) {
      load = const Timer(duration: Duration.zero);
    }

    return Exercise._(
      id: UuidValue.fromString(const Uuid().v1()),
      title: '',
      description: null,
      sets: 0,
      load: load,
      statistics: const [],
    );
  }

  factory Exercise.fromAbstractWithReps({
    required AbstractExercise abstractExercise,
    required int setsAmount,
    required int repsAmount,
  }) =>
      Exercise._(
        id: UuidValue.fromString(const Uuid().v1()),
        title: abstractExercise.title,
        description: abstractExercise.description,
        sets: setsAmount,
        load: Repetition(repsAmount: repsAmount),
        statistics: [],
      );

  factory Exercise.fromAbstractWithTimer({
    required AbstractExercise abstractExercise,
    required int setsAmount,
    required Duration duration,
  }) =>
      Exercise._(
        id: UuidValue.fromString(const Uuid().v1()),
        title: abstractExercise.title,
        description: abstractExercise.description,
        sets: setsAmount,
        load: Timer(duration: duration),
        statistics: [],
      );

  factory Exercise.emptyFromAbstract({
    required AbstractExercise abstractExercise,
  }) {
    late final ExerciseLoad load;

    if (abstractExercise.loadType == ExerciseLoadType.repetition) {
      load = const Repetition(repsAmount: 0);
    }

    if (abstractExercise.loadType == ExerciseLoadType.timer) {
      load = const Timer(duration: Duration.zero);
    }

    return Exercise._(
      id: UuidValue.fromString(const Uuid().v1()),
      title: abstractExercise.title,
      description: abstractExercise.description,
      sets: 0,
      load: load,
      statistics: [],
    );
  }

  const factory Exercise._({
    @UuidValueConverter() required UuidValue id,
    required String title,
    required String? description,
    required int sets,
    @ExerciseLoadConverter() required ExerciseLoad load,
    required List<ExerciseStatistic> statistics,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
}
