// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
      id: const UuidValueConverter().fromJson(json['id'] as String),
      weight: (json['weight'] as num).toDouble(),
      trainings: (json['trainings'] as List<dynamic>)
          .map((e) => Training.fromJson(e as Map<String, dynamic>))
          .toList(),
      meals: (json['meals'] as List<dynamic>)
          .map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'weight': instance.weight,
      'trainings': instance.trainings.map((e) => e.toJson()).toList(),
      'meals': instance.meals.map((e) => e.toJson()).toList(),
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
