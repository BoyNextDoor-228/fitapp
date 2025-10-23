import 'package:json_annotation/json_annotation.dart';

import '../repetition/repetition.dart';
import '../timer/timer.dart';

enum ExerciseLoadType {
  @JsonValue('repetition')
  repetition,
  @JsonValue('timer')
  timer
}

/// Describes abstract load of an Exercise.
abstract class ExerciseLoad {
  const ExerciseLoad();

  factory ExerciseLoad.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'repetition') {
      return Repetition.fromJson(json);
    }
    if (json['type'] == 'timer') {
      return Timer.fromJson(json);
    }

    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();

  ExerciseLoadType get type;
}
