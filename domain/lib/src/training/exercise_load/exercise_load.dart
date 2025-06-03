import 'package:json_annotation/json_annotation.dart';

import '../repetition/repetition.dart';
import '../timer/timer.dart';

enum ExerciseLoadType {
  @JsonValue('repetition')
  repetition,
  @JsonValue('timer')
  timer
}

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

// @JsonSerializable(constructor: 'timer')
// abstract class ExerciseLoad {
//   const factory ExerciseLoad.timer({ required int load }) = Timer;
//   const factory ExerciseLoad.repetition({ required int load }) = Repetition;
//
//   /// Constructor for nested classes
//   const ExerciseLoad.create();
//
//   /// FromJson constructor.
//   factory ExerciseLoad.fromJson(Map<String, dynamic> json) => _$ExerciseLoadFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ExerciseLoadToJson(this);
//
//   int get load;
// }
