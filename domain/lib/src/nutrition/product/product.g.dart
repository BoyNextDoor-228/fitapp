// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      name: json['name'] as String,
      nutritionFacts: NutritionFacts.fromJson(
          json['nutritionFacts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'name': instance.name,
      'nutritionFacts': instance.nutritionFacts.toJson(),
    };
