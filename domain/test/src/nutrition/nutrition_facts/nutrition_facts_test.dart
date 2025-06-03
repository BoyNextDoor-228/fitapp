import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';

const nutritionFactsJson = '''
{
  "proteins": 10,
  "fats": 15,
  "carbohydrates": 20,
  "kilocalories": 300
}
''';

void main() {
  group('Nutrition Facts test', () {
    late NutritionFacts nutritionFacts;

    setUp(() {
      nutritionFacts = const NutritionFacts(
        proteins: 10,
        fats: 15,
        carbohydrates: 20,
        kilocalories: 300,
      );
    });

    test("Nutrition Facts' toJson()", () {
      final json = nutritionFacts.toJson();
      expect(json, equals(jsonDecode(nutritionFactsJson)));
    });

    test("Nutrition Facts' fromJson()", () {
      final parsedNutritionFacts =
          NutritionFacts.fromJson(jsonDecode(nutritionFactsJson));
      expect(nutritionFacts, equals(parsedNutritionFacts));
    });
  });
}
