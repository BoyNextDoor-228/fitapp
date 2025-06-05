import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid_value.dart';

import 'ingredient_list_item.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({
    required this.ingredients,
    required this.ingredientAbsenceTitle,
    required this.itemDimension,
    super.key,
  })  : _isEditable = false,
        onEdited = null,
        onDeletePressed = null;

  const IngredientList.editable({
    required this.ingredients,
    required this.ingredientAbsenceTitle,
    required this.onEdited,
    required this.onDeletePressed,
    required this.itemDimension,
    super.key,
  }) : _isEditable = true;

  final List<Ingredient> ingredients;
  final void Function(UuidValue productId)? onDeletePressed;
  final void Function(Ingredient newIngredient)? onEdited;
  final String ingredientAbsenceTitle;
  final double itemDimension;
  final bool _isEditable;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ingredients.isEmpty
        ? Center(
            child: Text(
              ingredientAbsenceTitle,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ingredients.length,
            itemBuilder: (_, index) => _isEditable
                ? IngredientListItem.editable(
                    ingredient: ingredients[index],
                    onDeletePressed: () =>
                        onDeletePressed!(ingredients[index].product.id),
                    onEditPressed: onEdited,
                    itemDimension: itemDimension,
                  )
                : IngredientListItem(
                    ingredient: ingredients[index],
                    itemDimension: itemDimension,
                  ),
          );
  }
}
