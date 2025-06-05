// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Timer _$TimerFromJson(Map<String, dynamic> json) => _Timer(
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$TimerToJson(_Timer instance) => <String, dynamic>{
      'type': _$ExerciseLoadTypeEnumMap[instance.type]!,
      'duration': instance.duration.inMicroseconds,
    };

const _$ExerciseLoadTypeEnumMap = {
  ExerciseLoadType.repetition: 'repetition',
  ExerciseLoadType.timer: 'timer',
};
