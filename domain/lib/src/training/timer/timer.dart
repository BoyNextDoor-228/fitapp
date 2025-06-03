import 'package:freezed_annotation/freezed_annotation.dart';

import '../exercise_load/exercise_load.dart';

part 'timer.g.dart';
part 'timer.freezed.dart';

@freezed
class Timer extends ExerciseLoad with _$Timer {
  const factory Timer({required Duration duration}) = _Timer;

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  factory Timer.empty() => const Timer(duration: Duration.zero);

  const Timer._() : super();

  @JsonKey(includeToJson: true)
  @override
  ExerciseLoadType get type => ExerciseLoadType.timer;
}
