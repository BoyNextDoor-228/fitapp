import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class IngredientAmount extends StatelessWidget {
  /// Creates [Text] widget, displaying amount of [ingredient] and it's
  /// measurement unit.
  const IngredientAmount({
    required this.ingredient,
    super.key,
  });

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    switch (ingredient.product.measurementUnit) {
      case MeasurementUnit.milliliters:
        return Text(text.ingredientamountMl(ingredient.amount));
      case MeasurementUnit.grams:
        return Text(text.ingredientamountGr(ingredient.amount));
    }
  }
}
