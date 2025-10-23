import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../utils/uuid_value_converter.dart';
import '../ingredient/ingredient.dart';
import '../nutrition_facts/nutrition_facts.dart';

part 'meal.freezed.dart';

part 'meal.g.dart';

@freezed
abstract class Meal with _$Meal {
  const factory Meal.__({
    @UuidValueConverter() required UuidValue id,
    required String title,
    required List<Ingredient> ingredients,
    required String? recipe,
  }) = _Meal;

  /// Creates empty [Meal] with empty [title], empty [ingredients] list and
  /// no [recipe].
  factory Meal.empty() => Meal.__(
        id: UuidValue.fromString(const Uuid().v1()),
        title: '',
        ingredients: [],
        recipe: null,
      );

  /// Creates a [Meal] with specified [title] and optional [recipe].
  /// Initially [ingredients] list is empty.
  factory Meal.create({
    required String title,
    required String? recipe,
  }) =>
      Meal.__(
        id: UuidValue.fromString(const Uuid().v1()),
        title: title,
        ingredients: [],
        recipe: recipe,
      );

  const Meal._();

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  /// Returns [NutritionFacts] of this [Meal].
  NutritionFacts get nutritionFacts => _countNutritionFacts();

  /// Counts nutrition facts of this [Meal] and returns it.
  NutritionFacts _countNutritionFacts() {
    const initialNutritionFacts = NutritionFacts(
      proteins: 0,
      fats: 0,
      carbohydrates: 0,
      kilocalories: 0,
    );

    // Percent factor. Each nutrition fact is counted for 100 measurement units:
    // for 100 grams, 100 milliliters.
    const percentFactor = 0.01;

    return ingredients.fold<NutritionFacts>(
      initialNutritionFacts,
      (NutritionFacts total, Ingredient ingredient) =>
          total +
          (ingredient.product.nutritionFacts *
              percentFactor *
              ingredient.amount),
    );
  }
}
