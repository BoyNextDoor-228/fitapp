// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_facts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutritionFacts _$NutritionFactsFromJson(Map<String, dynamic> json) =>
    _NutritionFacts(
      proteins: (json['proteins'] as num).toDouble(),
      fats: (json['fats'] as num).toDouble(),
      carbohydrates: (json['carbohydrates'] as num).toDouble(),
      kilocalories: (json['kilocalories'] as num).toDouble(),
    );

Map<String, dynamic> _$NutritionFactsToJson(_NutritionFacts instance) =>
    <String, dynamic>{
      'proteins': instance.proteins,
      'fats': instance.fats,
      'carbohydrates': instance.carbohydrates,
      'kilocalories': instance.kilocalories,
    };
