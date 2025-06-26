import 'dart:async';

import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/show_deletion_dialog.dart';
import '../../app/widget/shared/nutrition_facts_table.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    required this.meal,
    required this.index,
    required this.itemDimension,
    required this.onDeletePressed,
    required this.onEditPressed,
    super.key,
  });

  final Meal meal;

  final int index;

  final VoidCallback onDeletePressed;
  final VoidCallback onEditPressed;

  final double itemDimension;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            height: itemDimension * MediaQuery.textScalerOf(context).scale(1),
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: _Header(
                    index: index,
                    meal: meal,
                    onEditPressed: onEditPressed,
                    onDeletePressed: onDeletePressed,
                  ),
                ),
                const Divider(
                  height: 0.1,
                  thickness: 0.25,
                ),
                Expanded(flex: 2, child: _Content(meal: meal)),
              ],
            ),
          ),
        ),
      );
}

class _Header extends StatelessWidget {
  const _Header({
    required this.index,
    required this.meal,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  final int index;
  final Meal meal;

  final VoidCallback onDeletePressed;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$index',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              meal.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: _CardMenuButtons(
              onDeletePressed: onDeletePressed,
              onEditPressed: onEditPressed,
            ),
          ),
        ],
      );
}

class _Content extends StatelessWidget {
  const _Content({required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Column(
      children: [
        Text(
          text.totalIngredientsN(meal.ingredients.length),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(
          child: NutritionFactsTable(
            proteins: meal.nutritionFacts.proteins,
            fats: meal.nutritionFacts.fats,
            carbohydrates: meal.nutritionFacts.carbohydrates,
            kilocalories: meal.nutritionFacts.kilocalories,
          ),
        ),
      ],
    );
  }
}

class _CardMenuButtons extends StatelessWidget {
  const _CardMenuButtons({
    required this.onDeletePressed,
    required this.onEditPressed,
  });

  final VoidCallback onDeletePressed;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return PopupMenuButton(
      itemBuilder: (_) => <PopupMenuEntry<FutureOr<void>>>[
        PopupMenuItem(
          onTap: () async => onEditPressed(),
          child: Text(text.edit),
        ),
        PopupMenuItem(
          child: Text(text.delete),
          onTap: () async => showDeletionDialog(
            context: context,
            onConfirmed: onDeletePressed,
            deleteWhat: text.meal,
          ),
        ),
      ],
    );
  }
}
