// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbstractExerciseImpl _$$AbstractExerciseImplFromJson(
        Map<String, dynamic> json) =>
    _$AbstractExerciseImpl(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      loadType: $enumDecode(_$ExerciseLoadTypeEnumMap, json['loadType']),
    );

Map<String, dynamic> _$$AbstractExerciseImplToJson(
        _$AbstractExerciseImpl instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'title': instance.title,
      'description': instance.description,
      'loadType': _$ExerciseLoadTypeEnumMap[instance.loadType]!,
    };

const _$ExerciseLoadTypeEnumMap = {
  ExerciseLoadType.repetition: 'repetition',
  ExerciseLoadType.timer: 'timer',
};
