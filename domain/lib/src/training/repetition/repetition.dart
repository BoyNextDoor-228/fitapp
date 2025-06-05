import 'package:freezed_annotation/freezed_annotation.dart';

import '../exercise_load/exercise_load.dart';

part 'repetition.g.dart';
part 'repetition.freezed.dart';

@freezed
abstract class Repetition extends ExerciseLoad with _$Repetition {
  const factory Repetition({required int repsAmount}) = _Repetition;

  factory Repetition.empty() => const Repetition(repsAmount: 0);

  factory Repetition.fromJson(Map<String, dynamic> json) =>
      _$RepetitionFromJson(json);

  const Repetition._() : super();

  @JsonKey(includeToJson: true)
  @override
  ExerciseLoadType get type => ExerciseLoadType.repetition;
}
