import 'package:freezed_annotation/freezed_annotation.dart';

import '../exercise_load/exercise_load.dart';

part 'repetition.g.dart';
part 'repetition.freezed.dart';

/// Describes [Repetition] as a concrete ancestor of [ExerciseLoad].
@freezed
abstract class Repetition extends ExerciseLoad with _$Repetition {
  const factory Repetition({required int repsAmount}) = _Repetition;

  /// Returns [Repetition] with zero [repsAmount].
  factory Repetition.empty() => const Repetition(repsAmount: 0);

  factory Repetition.fromJson(Map<String, dynamic> json) =>
      _$RepetitionFromJson(json);

  const Repetition._() : super();

  @JsonKey(includeToJson: true)
  @override
  ExerciseLoadType get type => ExerciseLoadType.repetition;
}
