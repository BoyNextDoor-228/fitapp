import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import 'measurement_unit_selector.dart';

class MeasurementUnitSelectorFormField extends StatelessWidget {
  /// Creates a [FormField] which implements a [SegmentedButton],
  /// which allows to select [MeasurementUnit].
  ///
  /// [onSaved] is called, when the form saved.
  ///
  /// [onChanged] is called, whenever user selects a [ButtonSegment], returns
  /// selected [MeasurementUnit].
  ///
  /// If [initialMeasurementUnit] is provided, [ButtonSegment] with
  /// corresponding value will be selected. Else [MeasurementUnit.grams]
  /// selected as default.
  const MeasurementUnitSelectorFormField({
    this.onSaved,
    this.initialMeasurementUnit = MeasurementUnit.grams,
    this.onChanged,
    super.key,
  });

  final MeasurementUnit initialMeasurementUnit;
  final void Function(MeasurementUnit?)? onSaved;
  final void Function(MeasurementUnit)? onChanged;

  @override
  Widget build(BuildContext context) => FormField<MeasurementUnit>(
        initialValue: initialMeasurementUnit,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSaved,
        builder: _buildSelector,
      );

  Widget _buildSelector(FormFieldState<MeasurementUnit> formState) =>
      MeasurementUnitSelector(
        initialMeasurementUnit: initialMeasurementUnit,
        onChanged: (loadType) {
          formState.didChange(loadType);
          if (onChanged != null) {
            onChanged?.call(loadType);
          }
        },
      );
}
