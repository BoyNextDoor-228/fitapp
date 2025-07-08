import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../domain/settings_values.dart';

class ContrastLevelSelector extends StatelessWidget {
  const ContrastLevelSelector({
    required this.initialContrastLevel,
    required this.onSelected,
    super.key,
  });

  final ContrastLevels initialContrastLevel;
  final Future<void> Function(ContrastLevels? contrastLevel) onSelected;

  List<DropdownMenuEntry<ContrastLevels>> _contrastLevels(S text) => [
        DropdownMenuEntry(value: ContrastLevels.low, label: text.low),
        DropdownMenuEntry(value: ContrastLevels.medium, label: text.medium),
        DropdownMenuEntry(value: ContrastLevels.high, label: text.high),
      ];

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return DropdownMenu<ContrastLevels>(
      // This key is added to force Dropdown Menu to update initial selection value.
      // If key is not provided, language of selected value will persist,
      // despite app language was explicitly changed.
      key: UniqueKey(),
      dropdownMenuEntries: _contrastLevels(text),
      initialSelection: initialContrastLevel,
      onSelected: (value) async => onSelected(value),
    );
  }
}
