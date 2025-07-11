import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../exception/unknown_exercise_load_type_exception.dart';
import '../../../../generated/l10n.dart';
import '../../../../tool/input_validator.dart';
import '../../../app/widget/shared/exercise_load_type_selector.dart';
import '../count_picker.dart';
import '../duration_picker.dart';

class ExerciseForm extends StatefulWidget {
  const ExerciseForm({
    required this.onFormApply,
    required this.actionButtonText,
    this.initialExercise,
    super.key,
  });

  final Exercise? initialExercise;
  final void Function(Exercise exercise) onFormApply;
  final String actionButtonText;

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  late Exercise _newExercise;

  @override
  void initState() {
    super.initState();

    _newExercise = widget.initialExercise ?? Exercise.empty();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 10,
          children: [
            ExerciseLoadTypeSelector(
              initialLoadType: _newExercise.load.type,
              onChanged: (loadType) {
                setState(() {
                  _updateLoadType(loadType);
                });
              },
            ),
            TextFormField(
              initialValue: _newExercise.title,
              onSaved: _saveTitleField,
              validator: InputValidator(s: text).titleValidator,
              decoration: InputDecoration(
                labelText: text.newExerciseTitle,
              ),
            ),
            TextFormField(
              initialValue: _newExercise.description,
              onSaved: _saveDescriptionField,
              decoration: InputDecoration(
                labelText: text.newExerciseDescriptionOptional,
              ),
            ),
            CountPicker(
              initialValue: _newExercise.sets,
              labelText: text.enterSetsCount,
              onChanged: (sets) {
                _newExercise = _newExercise.copyWith(
                  sets: sets,
                );
              },
            ),
            _exerciseLoadSelector(text),
            Center(
              child: OutlinedButton(
                onPressed: _applyForm,
                child: Text(widget.actionButtonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _applyForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      widget.onFormApply(_newExercise);

      if (widget.initialExercise == null) {
        _newExercise = Exercise.empty();
        _formKey.currentState?.reset();
      }
    }
  }

  Widget _exerciseLoadSelector(S text) {
    if (_newExercise.load.type == ExerciseLoadType.timer) {
      return DurationPicker(
        initialDuration: (_newExercise.load as Timer).duration,
        onChanged: (duration) {
          _newExercise = _newExercise.copyWith(
            load: Timer(duration: duration),
          );
        },
      );
    }

    if (_newExercise.load.type == ExerciseLoadType.repetition) {
      return CountPicker(
        initialValue: (_newExercise.load as Repetition).repsAmount,
        labelText: text.enterRepsCount,
        onChanged: (reps) {
          _newExercise = _newExercise.copyWith(
            load: Repetition(repsAmount: reps),
          );
        },
      );
    }

    throw UnknownExerciseLoadTypeException();
  }

  void _updateLoadType(ExerciseLoadType loadType) {
    late final ExerciseLoad exerciseLoad;

    if (loadType == ExerciseLoadType.repetition) {
      exerciseLoad = Repetition.empty();
    } else if (loadType == ExerciseLoadType.timer) {
      exerciseLoad = Timer.empty();
    } else {
      throw UnknownExerciseLoadTypeException();
    }

    _newExercise = _newExercise.copyWith(load: exerciseLoad);
  }

  void _saveTitleField(String? input) {
    _newExercise = _newExercise.copyWith(title: input!.trim());
  }

  void _saveDescriptionField(String? input) {
    _newExercise = _newExercise.copyWith(
      description: input == null || input.trim().isEmpty ? null : input.trim(),
    );
  }
}
