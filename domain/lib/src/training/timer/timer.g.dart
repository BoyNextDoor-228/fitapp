// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerImpl _$$TimerImplFromJson(Map<String, dynamic> json) => _$TimerImpl(
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$TimerImplToJson(_$TimerImpl instance) =>
    <String, dynamic>{
      'type': _$ExerciseLoadTypeEnumMap[instance.type]!,
      'duration': instance.duration.inMicroseconds,
    };

const _$ExerciseLoadTypeEnumMap = {
  ExerciseLoadType.repetition: 'repetition',
  ExerciseLoadType.timer: 'timer',
};
