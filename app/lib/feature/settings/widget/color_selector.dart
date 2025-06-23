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
        child: _ColorIndicator(
          color: initialColor,
          onTap: () async => _openColorSelectionMenu(context),
        ),
      );

  Future<void> _openColorSelectionMenu(BuildContext context) async {
    final screenHeight = MediaQuery.sizeOf(context).height;

    final colorSamples = colors
        .map(
          (colorCode) => _ColorIndicator(
            color: Color(colorCode),
            onTap: () => context.pop<int>(colorCode),
          ),
        )
        .toList();

    final color = await showBottomSheetWithResultOf<int>(
      context: context,
      height: screenHeight * 0.6,
      headerText: captionText,
      content: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2,
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
    required this.onTap,
  });

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: color,
            border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .secondary
                  .withValues(alpha: 0.5),
            ),
          ),
          child: const SizedBox.expand(),
        ),
      );
}
