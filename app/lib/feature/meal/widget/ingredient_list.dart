import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid_value.dart';

import 'ingredient_list_item.dart';

class IngredientList extends StatelessWidget {
  /// Creates scrollable list of [ingredients].
  ///
  /// [ingredientAbsenceTitle] is a message, that will be shown instead of list,
  /// if [ingredients] are absent.
  /// [itemDimension] is a dimension of a single item ([Card]) in list.
  const IngredientList({
    required this.ingredients,
    required this.ingredientAbsenceTitle,
    required this.itemDimension,
    super.key,
  })  : _isEditable = false,
        onEdited = null,
        onDelete = null;

  /// Creates scrollable and editable list of [ingredients].
  ///
  /// 'Editable' means each list item may be deleted or edited.
  /// [onEdited] is a callback, which implements editing of an ingredient.
  /// [onDelete] is a callback, which implements deletion of an ingredient.
  /// [ingredientAbsenceTitle] is a message, that will be shown instead of list,
  /// if [ingredients] are absent.
  /// [itemDimension] is a dimension of a single item ([Card]) in list.
  const IngredientList.editable({
    required this.ingredients,
    required this.ingredientAbsenceTitle,
    required this.onEdited,
    required this.onDelete,
    required this.itemDimension,
    super.key,
  }) : _isEditable = true;

  final List<Ingredient> ingredients;
  final void Function(UuidValue productId)? onDelete;
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
                    onDelete: () => onDelete!(ingredients[index].product.id),
                    onEdit: onEdited,
                    itemDimension: itemDimension,
                  )
                : IngredientListItem(
                    ingredient: ingredients[index],
                    itemDimension: itemDimension,
                  ),
          );
  }
}
