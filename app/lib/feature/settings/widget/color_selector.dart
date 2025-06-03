import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../tool/bottom_sheet_provider.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    required this.captionText,
    required this.onColorSelected,
    required this.initialColor,
    required this.colors,
    super.key,
  });

  final String captionText;
  final Future<void> Function(int color) onColorSelected;
  final Color initialColor;
  final List<int> colors;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () async => _openColorSelectionMenu(context),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: ColoredBox(
              color: initialColor,
              child: const SizedBox.expand(),
            ),
          ),
        ),
      );

  Future<void> _openColorSelectionMenu(BuildContext context) async {
    final colorSamples =
        colors.map((color) => _ColorIndicator(color: color)).toList();

    final color = await showBottomSheetWithResultOf<int>(
      context: context,
      headerText: captionText,
      content: GridView.count(
        crossAxisCount: 2,
        children: colorSamples,
      ),
    );

    if (color != null) {
      await onColorSelected(color);
    }
  }
}

class _ColorIndicator extends StatelessWidget {
  const _ColorIndicator({
    required this.color,
  });

  final int color;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () => context.pop<int>(color),
          child: ColoredBox(
            color: Color(color),
            child: const SizedBox.expand(),
          ),
        ),
      );
}
