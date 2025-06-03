// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
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

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': const UuidValueConverter().toJson(instance.id),
      'weight': instance.weight,
      'trainings': instance.trainings.map((e) => e.toJson()).toList(),
      'meals': instance.meals.map((e) => e.toJson()).toList(),
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
