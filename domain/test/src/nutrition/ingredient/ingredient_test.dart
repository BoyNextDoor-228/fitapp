import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

const ingredient1Json = '''
{
  "product": {
    "id": "5ca629eb-0775-4f36-8ba7-8e32d22926be",
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
}
''';

const ingredient2Json = '''
{
  "product": {
    "id": "72a629eb-0775-4f36-8ba7-8e32d2292621",
    "name": "Product 2",
    "nutritionFacts": {
      "proteins": 9,
      "fats": 11,
      "carbohydrates": 50,
      "kilocalories": 230
    }
  },
  "amount": 300,
  "measurement": "milliliters"
}
''';

void main() {
  group('Ingredient test: milligrams', () {
    late Ingredient ingredient;

    setUp(() {
      const nutritionFacts = NutritionFacts(
        proteins: 10,
        fats: 15,
        carbohydrates: 20,
        kilocalories: 300,
      );

      var product = Product.create(
        name: 'Product 1',
        nutritionFacts: nutritionFacts,
      );

      product = product.copyWith(
        id: UuidValue.fromString('5ca629eb-0775-4f36-8ba7-8e32d22926be'),
      );

      ingredient = Ingredient(
        product: product,
        amount: 200,
        measurement: MeasurementUnit.grams,
      );
    });

    test("Ingredient's toJson()", () {
      final json = ingredient.toJson();
      expect(json, equals(jsonDecode(ingredient1Json)));
    });

    test("Ingredient's fromJson()", () {
      final parsedIngredient = Ingredient.fromJson(jsonDecode(ingredient1Json));
      expect(ingredient, equals(parsedIngredient));
    });
  });

  group('Ingredient test: milliliters', () {
    late Ingredient ingredient;

    setUp(() {
      const nutritionFacts = NutritionFacts(
        proteins: 9,
        fats: 11,
        carbohydrates: 50,
        kilocalories: 230,
      );

      var product = Product.create(
        name: 'Product 2',
        nutritionFacts: nutritionFacts,
      );

      product = product.copyWith(
        id: UuidValue.fromString('72a629eb-0775-4f36-8ba7-8e32d2292621'),
      );

      ingredient = Ingredient(
        product: product,
        amount: 300,
        measurement: MeasurementUnit.milliliters,
      );
    });

    test("Ingredient's toJson()", () {
      final json = ingredient.toJson();
      expect(json, equals(jsonDecode(ingredient2Json)));
    });

    test("Ingredient's fromJson()", () {
      final parsedIngredient = Ingredient.fromJson(jsonDecode(ingredient2Json));
      expect(ingredient, equals(parsedIngredient));
    });
  });
}
