// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'product': instance.product.toJson(),
      'amount': instance.amount,
    };
