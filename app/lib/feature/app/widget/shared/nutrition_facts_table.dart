import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class NutritionFactsTable extends StatelessWidget {
  const NutritionFactsTable({
    required this.proteins,
    required this.fats,
    required this.carbohydrates,
    required this.kilocalories,
    super.key,
  });

  final num proteins;
  final num fats;
  final num carbohydrates;
  final num kilocalories;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Table(
      children: [
        TableRow(
          children: [
            _TableCell(title: text.proteins, value: proteins.toString()),
            _TableCell(title: text.fats, value: proteins.toString()),
          ],
        ),
        TableRow(
          children: [
            _TableCell(
              title: text.carbohydrates,
              value: carbohydrates.toString(),
            ),
            _TableCell(
              title: text.kilocalories,
              value: kilocalories.toString(),
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
