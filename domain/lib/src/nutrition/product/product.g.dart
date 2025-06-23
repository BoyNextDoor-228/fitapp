// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      name: json['name'] as String,
      measurementUnit:
          $enumDecode(_$MeasurementUnitEnumMap, json['measurementUnit']),
      nutritionFacts: NutritionFacts.fromJson(
          json['nutritionFacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'name': instance.name,
      'measurementUnit': _$MeasurementUnitEnumMap[instance.measurementUnit]!,
      'nutritionFacts': instance.nutritionFacts.toJson(),
    };

const _$MeasurementUnitEnumMap = {
  MeasurementUnit.milliliters: 'milliliters',
  MeasurementUnit.grams: 'grams',
};
