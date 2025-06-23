// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Repetition _$RepetitionFromJson(Map<String, dynamic> json) => _Repetition(
      repsAmount: (json['repsAmount'] as num).toInt(),
    );

Map<String, dynamic> _$RepetitionToJson(_Repetition instance) =>
    <String, dynamic>{
      'type': _$ExerciseLoadTypeEnumMap[instance.type]!,
      'repsAmount': instance.repsAmount,
    };

const _$ExerciseLoadTypeEnumMap = {
  ExerciseLoadType.repetition: 'repetition',
  ExerciseLoadType.timer: 'timer',
};
