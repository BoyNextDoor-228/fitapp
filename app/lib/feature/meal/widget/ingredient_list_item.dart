import 'dart:async';

import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/bottom_sheet_provider.dart';
import '../../app/widget/shared/nutrition_facts_table.dart';
import 'form/ingredient_form.dart';
import 'ingredient_amount.dart';

class IngredientListItem extends StatelessWidget {
  const IngredientListItem({
    required this.ingredient,
    required this.itemDimension,
    super.key,
  })  : _isEditable = false,
        onEditPressed = null,
        onDeletePressed = null;

  const IngredientListItem.editable({
    required this.ingredient,
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.itemDimension,
    super.key,
  }) : _isEditable = true;

  final Ingredient ingredient;

  final VoidCallback? onDeletePressed;
  final void Function(Ingredient newIngredient)? onEditPressed;

  final bool _isEditable;
  final double itemDimension;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox.square(
            dimension: itemDimension,
            child: Column(
              spacing: 5,
              children: [
                Expanded(
                  child: _Header(
                    ingredient: ingredient,
                    isEditable: _isEditable,
                    onDeletePressed: onDeletePressed,
                    onEditPressed: onEditPressed,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _Content(ingredient: ingredient),
                ),
              ],
            ),
          ),
        ),
      );
}

class _Header extends StatelessWidget {
  const _Header({
    required this.ingredient,
    required this.isEditable,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  final Ingredient ingredient;
  final bool isEditable;

  final VoidCallback? onDeletePressed;
  final void Function(Ingredient newIngredient)? onEditPressed;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 8,
            child: Text(
              ingredient.product.name * 100,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (isEditable)
            Expanded(
              child: _CardMenuButtons(
                ingredient: ingredient,
                onDeletePressed: onDeletePressed!,
                onEditPressed: onEditPressed!,
              ),
            ),
        ],
      );
}

class _Content extends StatelessWidget {
  const _Content({required this.ingredient});

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          IngredientAmount(ingredient: ingredient),
          Expanded(
            child: Center(
              child: NutritionFactsTable(
                proteins: ingredient.product.nutritionFacts.proteins,
                fats: ingredient.product.nutritionFacts.fats,
                carbohydrates: ingredient.product.nutritionFacts.carbohydrates,
                kilocalories: ingredient.product.nutritionFacts.kilocalories,
              ),
            ),
          ),
        ],
      );
}

class _CardMenuButtons extends StatelessWidget {
  const _CardMenuButtons({
    required this.ingredient,
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  final Ingredient ingredient;

  final VoidCallback onDeletePressed;
  final void Function(Ingredient newIngredient) onEditPressed;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuEntry<FutureOr<void>>>[
        PopupMenuItem(
          onTap: () async {
            await _openIngredientEditingModal(context);
          },
          child: Text(text.edit),
        ),
        PopupMenuItem(
          child: Text(text.delete),
          // TODO(BoyNextDoor-228): Implement as extension.
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(text.deletion),
                content: Text(
                  text.areYouSureYouWantToDeleteThisObject('ingredient'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(text.no),
                  ),
                  TextButton(
                    onPressed: () {
                      onDeletePressed();
                      Navigator.pop(context);
                    },
                    child: Text(text.yes),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> _openIngredientEditingModal(BuildContext context) async {
    final text = S.of(context);

    await showVoidModalBottomSheet(
      context: context,
      headerText: text.ingredientEditing,
      content: IngredientForm(
        initialIngredient: ingredient,
        onFormApply: onEditPressed,
        actionButtonText: text.saveChanges,
      ),
    );
  }
}
