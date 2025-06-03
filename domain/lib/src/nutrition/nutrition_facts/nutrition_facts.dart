import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_facts.g.dart';
part 'nutrition_facts.freezed.dart';

@freezed
class NutritionFacts with _$NutritionFacts {
  const factory NutritionFacts({
    required double proteins,
    required double fats,
    required double carbohydrates,
    required double kilocalories,
  }) = _NutritionFacts;

  const NutritionFacts._();

  factory NutritionFacts.empty() => const NutritionFacts(
        proteins: 0,
        fats: 0,
        carbohydrates: 0,
        kilocalories: 0,
      );

  factory NutritionFacts.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsFromJson(json);

  NutritionFacts operator +(NutritionFacts otherNutritionFacts) =>
      NutritionFacts(
        proteins: proteins + otherNutritionFacts.proteins,
        fats: fats + otherNutritionFacts.fats,
        carbohydrates: carbohydrates + otherNutritionFacts.carbohydrates,
        kilocalories: kilocalories + otherNutritionFacts.kilocalories,
      );

  NutritionFacts operator *(num amount) => NutritionFacts(
        proteins: proteins * amount,
        fats: fats * amount,
        carbohydrates: carbohydrates * amount,
        kilocalories: kilocalories * amount,
      );

  @override
  String toString() =>
      'Proteins: $proteins, Fats: $fats, Carbohydrates: $carbohydrates, Kilocalories: $kilocalories';
}
