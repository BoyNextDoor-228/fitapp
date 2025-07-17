import 'dart:async';

import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/bottom_sheet_provider.dart';
import '../../../tool/show_deletion_dialog.dart';
import '../../app/widget/shared/nutrition_facts_table.dart';
import 'form/ingredient_form.dart';
import 'ingredient_amount.dart';

class IngredientListItem extends StatelessWidget {
  /// Creates a representation of an [ingredient] list item.
  ///
  /// [itemDimension] is a dimension of the item ([Card]).
  const IngredientListItem({
    required this.ingredient,
    required this.itemDimension,
    super.key,
  })  : _isEditable = false,
        onEdit = null,
        onDelete = null;

  /// Creates a representation of an [ingredient]. Has 'Edit' and 'Delete'
  /// buttons.
  ///
  /// [onEdit] is a callback, which implements editing of an ingredient.
  /// [onDelete] is a callback, which implements deletion of an ingredient.
  /// [itemDimension] is a dimension of the item ([Card]).
  const IngredientListItem.editable({
    required this.ingredient,
    required this.onDelete,
    required this.onEdit,
    required this.itemDimension,
    super.key,
  }) : _isEditable = true;

  final Ingredient ingredient;

  final VoidCallback? onDelete;
  final void Function(Ingredient newIngredient)? onEdit;

  final bool _isEditable;
  final double itemDimension;

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          shadowColor: Theme.of(context).colorScheme.inversePrimary,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox.square(
              dimension: itemDimension,
              child: Column(
                spacing: 5,
                children: [
                  Expanded(
                    child: _Header(
                      ingredient: ingredient,
                      isEditable: _isEditable,
                      onDelete: onDelete,
                      onEdit: onEdit,
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
        ),
      );
}

class _Header extends StatelessWidget {
  const _Header({
    required this.ingredient,
    required this.isEditable,
    required this.onDelete,
    required this.onEdit,
  });

  final Ingredient ingredient;
  final bool isEditable;

  final VoidCallback? onDelete;
  final void Function(Ingredient newIngredient)? onEdit;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              ingredient.product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (isEditable)
            _CardMenuButtons(
              ingredient: ingredient,
              onDelete: onDelete!,
              onEdit: onEdit!,
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
    required this.onDelete,
    required this.onEdit,
  });

  final Ingredient ingredient;

  final VoidCallback onDelete;
  final void Function(Ingredient newIngredient) onEdit;

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
          onTap: () async => showDeletionDialog(
            context: context,
            onConfirmed: onDelete,
            deleteWhat: text.ingredient,
          ),
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
        onFormApply: onEdit,
        actionButtonText: text.saveChanges,
      ),
    );
  }
}
