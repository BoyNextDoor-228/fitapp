// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseStatisticImpl _$$ExerciseStatisticImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseStatisticImpl(
      load: const ExerciseLoadConverter()
          .fromJson(json['load'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ExerciseStatisticImplToJson(
        _$ExerciseStatisticImpl instance) =>
    <String, dynamic>{
      'load': const ExerciseLoadConverter().toJson(instance.load),
      'date': instance.date.toIso8601String(),
    };
