import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:uuid/uuid_value.dart';

const productsAmount = 10;

const lowMultiplier = 1.0;
const midMultiplier = 10.0;
const highMultiplier = 50.0;

final mockProducts = List<Product>.generate(
  productsAmount,
  (int index) => Product.create(
    name: 'Product №$index',
    measurementUnit:
        index.isEven ? MeasurementUnit.milliliters : MeasurementUnit.grams,
    nutritionFacts: NutritionFacts(
      proteins: lowMultiplier * index,
      fats: lowMultiplier * index,
      carbohydrates: midMultiplier * index,
      kilocalories: highMultiplier * index,
    ),
  ).copyWith(
    id: UuidValue.fromString('c91b3518-ede2-11ef-8300-a3504b8d50ff'),
  ),
);

final mockProductsJson = jsonEncode(mockProducts);
