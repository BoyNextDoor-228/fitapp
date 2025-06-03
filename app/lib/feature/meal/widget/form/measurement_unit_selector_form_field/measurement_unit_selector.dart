import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class MeasurementUnitSelector extends StatefulWidget {
  const MeasurementUnitSelector({
    required this.onChanged,
    this.initialMeasurementUnit,
    super.key,
  });

  final MeasurementUnit? initialMeasurementUnit;
  final void Function(MeasurementUnit newMeasurementUnit) onChanged;

  @override
  State<MeasurementUnitSelector> createState() =>
      _MeasurementUnitSelectorState();
}

class _MeasurementUnitSelectorState extends State<MeasurementUnitSelector> {
  late MeasurementUnit _selectedMeasurementUnit;

  @override
  void initState() {
    super.initState();

    _selectedMeasurementUnit =
        widget.initialMeasurementUnit ?? MeasurementUnit.grams;
  }

  @override
  Widget build(BuildContext context) => SegmentedButton<MeasurementUnit>(
        selected: {_selectedMeasurementUnit},
        onSelectionChanged: _changeSelection,
        segments: _buttonSegments(context),
      );

  void _changeSelection(Set<MeasurementUnit> newSelection) {
    setState(() {
      _selectedMeasurementUnit = newSelection.single;
    });

    widget.onChanged(_selectedMeasurementUnit);
  }

  List<ButtonSegment<MeasurementUnit>> _buttonSegments(BuildContext context) {
    final text = S.of(context);

    return [
      ButtonSegment(
        label: Text(text.grams),
        value: MeasurementUnit.grams,
      ),
      ButtonSegment(
        label: Text(text.milliliters),
        value: MeasurementUnit.milliliters,
      ),
    ];
  }
}
