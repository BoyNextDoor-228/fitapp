import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

const meal1Json = '''
{
  "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
  "title": "Test meal 1",
  "recipe": null,
  "ingredients": [] 
}
''';

const meal2Json = '''
{
  "id": "12a629eb-0775-4f36-8ba7-8e32d2292621",
  "title": "Test meal 2",
  "recipe": "Test meal 2 recipe",
  "ingredients": [
    {
      "product": {
        "id": "a1a629eb-0775-4f36-8ba7-8e32d229261a",
        "name": "Product 1",
        "nutritionFacts": {
          "proteins": 10,
          "fats": 15,
          "carbohydrates": 20,
          "kilocalories": 300
        }
      },
      "amount": 200,
      "measurement": "grams"
    },
    {
      "product": {
        "id": "2aa629eb-0775-4f36-8ba7-8e32d22926a2",
        "name": "Product 2",
        "nutritionFacts": {
          "proteins": 11,
          "fats": 12,
          "carbohydrates": 21,
          "kilocalories": 250
        }
      },
      "amount": 100,
      "measurement": "milliliters"
    }
  ] 
}
''';

void main() {
  group('Meal test: empty meal', () {
    late Meal meal;

    setUp(() {
      meal = Meal.create(title: 'Test meal 1', recipe: null);

      meal = meal.copyWith(
        id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
      );
    });

    test("Meal's toJson()", () {
      final json = meal.toJson();
      expect(json, equals(jsonDecode(meal1Json)));
    });

    test("Meal's fromJson()", () {
      final parsedMeal = Meal.fromJson(jsonDecode(meal1Json));
      expect(meal, equals(parsedMeal));
    });
  });

  group('Meal test: filled with ingredients', () {
    late Meal meal;

    setUp(() {
      meal = Meal.create(title: 'Test meal 2', recipe: 'Test meal 2 recipe');

      const nutritionFacts1 = NutritionFacts(
        proteins: 10,
        fats: 15,
        carbohydrates: 20,
        kilocalories: 300,
      );

      const nutritionFacts2 = NutritionFacts(
        proteins: 11,
        fats: 12,
        carbohydrates: 21,
        kilocalories: 250,
      );

      final product1 = Product.create(
        name: 'Product 1',
        nutritionFacts: nutritionFacts1,
      ).copyWith(
        id: UuidValue.fromString('a1a629eb-0775-4f36-8ba7-8e32d229261a'),
      );

      final product2 = Product.create(
        name: 'Product 2',
        nutritionFacts: nutritionFacts2,
      ).copyWith(
        id: UuidValue.fromString('2aa629eb-0775-4f36-8ba7-8e32d22926a2'),
      );

      final ingredient1 = Ingredient(
        product: product1,
        amount: 200,
        measurement: MeasurementUnit.grams,
      );

      final ingredient2 = Ingredient(
        product: product2,
        amount: 100,
        measurement: MeasurementUnit.milliliters,
      );

      meal = meal.copyWith(
        id: UuidValue.fromString('12a629eb-0775-4f36-8ba7-8e32d2292621'),
        ingredients: [ingredient1, ingredient2],
      );
    });

    test("Meal's toJson()", () {
      final json = meal.toJson();
      expect(json, equals(jsonDecode(meal2Json)));
    });

    test("Meal's fromJson()", () {
      final parsedMeal = Meal.fromJson(jsonDecode(meal2Json));
      expect(meal, equals(parsedMeal));
    });
  });
}
