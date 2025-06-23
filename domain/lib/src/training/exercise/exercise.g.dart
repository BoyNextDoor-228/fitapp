// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Exercise _$ExerciseFromJson(Map<String, dynamic> json) => _Exercise(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      sets: (json['sets'] as num).toInt(),
      load: const ExerciseLoadConverter()
          .fromJson(json['load'] as Map<String, dynamic>),
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => ExerciseStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExerciseToJson(_Exercise instance) => <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'title': instance.title,
      'description': instance.description,
      'sets': instance.sets,
      'load': const ExerciseLoadConverter().toJson(instance.load),
      'statistics': instance.statistics.map((e) => e.toJson()).toList(),
    };
