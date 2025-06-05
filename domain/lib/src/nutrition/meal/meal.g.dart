// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Meal _$MealFromJson(Map<String, dynamic> json) => _Meal(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      title: json['title'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipe: json['recipe'] as String?,
    );

Map<String, dynamic> _$MealToJson(_Meal instance) => <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'title': instance.title,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'recipe': instance.recipe,
    };
