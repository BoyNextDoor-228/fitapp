import 'dart:async';

import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../tool/show_deletion_dialog.dart';
import '../../app/widget/shared/nutrition_facts_table.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    required this.product,
    required this.index,
    required this.itemDimension,
    super.key,
  })  : _isEditable = false,
        onEditPressed = null,
        onDeletePressed = null;

  const ProductListItem.editable({
    required this.product,
    required this.index,
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.itemDimension,
    super.key,
  }) : _isEditable = true;

  final Product product;
  final int index;

  final VoidCallback? onDeletePressed;
  final VoidCallback? onEditPressed;

  final bool _isEditable;

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
                    product: product,
                    isEditable: _isEditable,
                    onEditPressed: onEditPressed,
                    onDeletePressed: onDeletePressed,
                  ),
                ),
                const Divider(
                  height: 0.1,
                  thickness: 0.25,
                ),
                Expanded(
                  flex: 2,
                  child: NutritionFactsTable(
                    proteins: product.nutritionFacts.proteins,
                    fats: product.nutritionFacts.fats,
                    carbohydrates: product.nutritionFacts.carbohydrates,
                    kilocalories: product.nutritionFacts.kilocalories,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _Header extends StatelessWidget {
  const _Header({
    required this.index,
    required this.product,
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.isEditable,
  });

  final bool isEditable;

  final int index;
  final Product product;

  final VoidCallback? onDeletePressed;
  final VoidCallback? onEditPressed;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              product.name,
              maxLines: 2,
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
                onDeletePressed: onDeletePressed!,
                onEditPressed: onEditPressed!,
              ),
            ),
        ],
      );
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
          onTap: onEditPressed,
          child: Text(text.edit),
        ),
        PopupMenuItem(
          child: Text(text.delete),
          onTap: () async => showDeletionDialog(
            context: context,
            onConfirmed: onDeletePressed,
            deleteWhat: text.product,
          ),
        ),
      ],
    );
  }
}
