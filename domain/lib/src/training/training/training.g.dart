// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainingImpl _$$TrainingImplFromJson(Map<String, dynamic> json) =>
    _$TrainingImpl(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrainingImplToJson(_$TrainingImpl instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'title': instance.title,
      'description': instance.description,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
    };
