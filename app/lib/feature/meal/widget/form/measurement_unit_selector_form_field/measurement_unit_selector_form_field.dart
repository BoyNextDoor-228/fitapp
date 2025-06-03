import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import 'measurement_unit_selector.dart';

class MeasurementUnitSelectorFormField extends StatelessWidget {
  const MeasurementUnitSelectorFormField({
    this.onSaved,
    this.initialMeasurementUnit,
    this.onChanged,
    super.key,
  });

  final MeasurementUnit? initialMeasurementUnit;
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
