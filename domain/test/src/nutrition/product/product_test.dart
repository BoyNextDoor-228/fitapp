import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

const productJson = '''
{
  "id": "5ca629eb-0775-4f36-8ba7-8e32d22926be",
  "name": "Test product",
  "nutritionFacts": {
    "proteins": 10,
    "fats": 15,
    "carbohydrates": 20,
    "kilocalories": 300
  }
}
''';

void main() {
  group('Product test', () {
    late Product product;

    setUp(() {
      const nutritionFacts = NutritionFacts(
        proteins: 10,
        fats: 15,
        carbohydrates: 20,
        kilocalories: 300,
      );

      product = Product.create(
        name: 'Test product',
        nutritionFacts: nutritionFacts,
      );

      product = product.copyWith(
        id: UuidValue.fromString('5ca629eb-0775-4f36-8ba7-8e32d22926be'),
      );
    });

    test("Product's toJson()", () {
      final json = product.toJson();
      expect(json, equals(jsonDecode(productJson)));
    });

    test("Product's fromJson()", () {
      final parsedProduct = Product.fromJson(jsonDecode(productJson));
      expect(product, equals(parsedProduct));
    });
  });
}
