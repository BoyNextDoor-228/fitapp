import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../domain.dart';
import '../../utils/exercise_load_converter.dart';
import '../../utils/uuid_value_converter.dart';

part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
abstract class Exercise with _$Exercise {
  /// Creates [Exercise] with specified [title], numbers of [sets],
  /// [load], [statistics], optional [description] and [id].
  ///
  /// If [id] was not passed, it assigns automatically.
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

  /// Creates an empty [Exercise], based on passed [loadType], with empty
  /// [title], [description], [statistics] and zero [sets].
  ///
  /// If [loadType] is [ExerciseLoadType.repetition] or [loadType] is not passed,
  /// [loadType] of created empty [Exercise] will be [Repetition] with zero
  /// repsAmount.
  ///
  /// If [loadType] is [ExerciseLoadType.timer], [loadType] of created empty
  /// [Exercise] will be [Timer] with zero [Duration].
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
