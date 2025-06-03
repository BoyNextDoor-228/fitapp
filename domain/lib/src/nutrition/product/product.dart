import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../utils/uuid_value_converter.dart';
import '../nutrition_facts/nutrition_facts.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product._({
    @UuidValueConverter() required UuidValue id,
    required String name,
    required NutritionFacts nutritionFacts,
  }) = _Product;

  factory Product.empty() => Product._(
        id: UuidValue.fromString(const Uuid().v1()),
        name: '',
        nutritionFacts: NutritionFacts.empty(),
      );

  factory Product.create({
    required String name,
    required NutritionFacts nutritionFacts,
  }) =>
      Product._(
        id: UuidValue.fromString(const Uuid().v1()),
        name: name,
        nutritionFacts: nutritionFacts,
      );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
