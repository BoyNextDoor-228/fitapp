import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/exercise_load_converter.dart';
import '../exercise_load/exercise_load.dart';

part 'exercise_statistic.g.dart';
part 'exercise_statistic.freezed.dart';

@freezed
abstract class ExerciseStatistic with _$ExerciseStatistic {
  const factory ExerciseStatistic({
    @ExerciseLoadConverter() required ExerciseLoad load,
    required DateTime date,
  }) = _ExerciseStatistic;

  const ExerciseStatistic._();

  factory ExerciseStatistic.fromJson(Map<String, dynamic> json) =>
      _$ExerciseStatisticFromJson(json);
}
