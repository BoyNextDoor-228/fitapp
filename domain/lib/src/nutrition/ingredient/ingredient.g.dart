// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      measurement: $enumDecode(_$MeasurementUnitEnumMap, json['measurement']),
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'amount': instance.amount,
      'measurement': _$MeasurementUnitEnumMap[instance.measurement]!,
    };

const _$MeasurementUnitEnumMap = {
  MeasurementUnit.milliliters: 'milliliters',
  MeasurementUnit.grams: 'grams',
};
