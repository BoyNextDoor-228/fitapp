import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import 'exercise_load_type_selector.dart';

class ExerciseLoadTypeSelectorFormField extends StatelessWidget {
  const ExerciseLoadTypeSelectorFormField({
    this.onSaved,
    this.initialLoadType,
    this.onChanged,
    super.key,
  });

  final ExerciseLoadType? initialLoadType;
  final void Function(ExerciseLoadType?)? onSaved;
  final void Function(ExerciseLoadType)? onChanged;

  @override
  Widget build(BuildContext context) => FormField<ExerciseLoadType>(
        initialValue: initialLoadType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSaved,
        builder: _buildSelector,
      );

  Widget _buildSelector(FormFieldState<ExerciseLoadType> formState) =>
      ExerciseLoadTypeSelector(
        initialLoadType: initialLoadType,
        onChanged: (loadType) {
          formState.didChange(loadType);
          if (onChanged != null) {
            onChanged?.call(loadType);
          }
        },
      );
}
