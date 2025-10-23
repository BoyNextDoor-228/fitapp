import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  /// Ingredient of a meal.
  ///
  /// Contains [product] and [amount] of this [product].
  const factory Ingredient({
    required Product product,
    required double amount,
  }) = _Ingredient;

  /// Creates an [Ingredient] with zero [amount] and empty [product]
  factory Ingredient.empty() => Ingredient(
        product: Product.empty(),
        amount: 0,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
