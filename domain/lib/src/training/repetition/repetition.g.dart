// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepetitionImpl _$$RepetitionImplFromJson(Map<String, dynamic> json) =>
    _$RepetitionImpl(
      repsAmount: (json['repsAmount'] as num).toInt(),
    );

Map<String, dynamic> _$$RepetitionImplToJson(_$RepetitionImpl instance) =>
    <String, dynamic>{
      'type': _$ExerciseLoadTypeEnumMap[instance.type]!,
      'repsAmount': instance.repsAmount,
    };

const _$ExerciseLoadTypeEnumMap = {
  ExerciseLoadType.repetition: 'repetition',
  ExerciseLoadType.timer: 'timer',
};
