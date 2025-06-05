// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseStatistic _$ExerciseStatisticFromJson(Map<String, dynamic> json) =>
    _ExerciseStatistic(
      load: const ExerciseLoadConverter()
          .fromJson(json['load'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ExerciseStatisticToJson(_ExerciseStatistic instance) =>
    <String, dynamic>{
      'load': const ExerciseLoadConverter().toJson(instance.load),
      'date': instance.date.toIso8601String(),
    };
