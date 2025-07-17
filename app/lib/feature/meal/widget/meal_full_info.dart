import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'ingredient_list.dart';

class MealFullInfo extends StatelessWidget {
  /// Creates a widget, that displays full information about [meal].
  ///
  /// Displays meal title, recipe (if present), list of ingredients.
  const MealFullInfo({
    required this.meal,
    super.key,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final ingredientsListHeight = MediaQuery.sizeOf(context).longestSide * 0.4;

    final text = S.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleLarge,
          ),
          Text(
            meal.recipe ?? text.noRecipe,
            style: textTheme.titleMedium,
          ),
          const Divider(),
          SizedBox(
            height: ingredientsListHeight,
            width: double.infinity,
            child: IngredientList(
              ingredients: meal.ingredients,
              ingredientAbsenceTitle: text.noIngredientsYet,
              itemDimension: ingredientsListHeight,
            ),
          ),
        ],
      ),
    );
  }
}
