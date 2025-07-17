import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class MeasurementUnitSelector extends StatefulWidget {
  /// Creates a [SegmentedButton], which allows to select [MeasurementUnit].
  ///
  /// [onChanged] is called, whenever user selects a [ButtonSegment], returns
  /// selected [MeasurementUnit].
  ///
  /// [initialMeasurementUnit] sets [ButtonSegment] corresponding value.
  const MeasurementUnitSelector({
    required this.onChanged,
    required this.initialMeasurementUnit,
    super.key,
  });

  final MeasurementUnit initialMeasurementUnit;
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

    _selectedMeasurementUnit = widget.initialMeasurementUnit;
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Expanded(
            child: Text(
              S.of(context).measurementUnit,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: SegmentedButton<MeasurementUnit>(
              selected: {_selectedMeasurementUnit},
              onSelectionChanged: _changeSelection,
              segments: _buttonSegments(context),
            ),
          ),
        ],
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
