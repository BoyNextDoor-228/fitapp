import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class NutritionFactsTable extends StatelessWidget {
  /// Creates a 2x2 table, which displays number of [proteins], [fats],
  /// [carbohydrates] and [kilocalories].
  ///
  /// If [caption] is provided, it will be displayed above the table.
  const NutritionFactsTable({
    required this.proteins,
    required this.fats,
    required this.carbohydrates,
    required this.kilocalories,
    this.caption,
    super.key,
  });

  /// Creates a 2x2 table, which displays nutrition facts with zero values.
  ///
  /// If [caption] is provided, it will be displayed above the table.
  const NutritionFactsTable.empty({
    this.caption,
    super.key,
  })  : proteins = 0,
        fats = 0,
        carbohydrates = 0,
        kilocalories = 0;

  final String? caption;

  final num proteins;
  final num fats;
  final num carbohydrates;
  final num kilocalories;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Column(
      children: [
        if (caption != null)
          Text(
            caption!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        Table(
          children: [
            TableRow(
              children: [
                _TableCell(
                  title: text.proteins,
                  value: proteins.toStringAsFixed(2),
                ),
                _TableCell(title: text.fats, value: fats.toStringAsFixed(2)),
              ],
            ),
            TableRow(
              children: [
                _TableCell(
                  title: text.carbohydrates,
                  value: carbohydrates.toStringAsFixed(2),
                ),
                _TableCell(
                  title: text.kilocalories,
                  value: kilocalories.toStringAsFixed(2),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _TableCell extends StatelessWidget {
  const _TableCell({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final nutritionFactTitleStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold);
    final nutritionFactValueStyle = textTheme.titleSmall;

    return TableCell(
      child: Card(
        elevation: 1,
        child: Column(
          children: [
            Text(
              '$title:',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: nutritionFactTitleStyle,
            ),
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: nutritionFactValueStyle,
            ),
          ],
        ),
      ),
    );
  }
}
