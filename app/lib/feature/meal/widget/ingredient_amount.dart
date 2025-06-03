import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class IngredientAmount extends StatelessWidget {
  const IngredientAmount({
    required this.ingredient,
    super.key,
  });

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    if (ingredient.measurement == MeasurementUnit.milliliters) {
      return Text(text.ingredientamountMl(ingredient.amount));
    }

    return Text(text.ingredientamountGr(ingredient.amount));
  }
}
