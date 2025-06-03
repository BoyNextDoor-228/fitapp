import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/measurement_unit.dart';
import '../product/product.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required Product product,
    required double amount,
    required MeasurementUnit measurement,
  }) = _Ingredient;

  factory Ingredient.empty() => Ingredient(
        product: Product.empty(),
        amount: 0,
        measurement: MeasurementUnit.grams,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
