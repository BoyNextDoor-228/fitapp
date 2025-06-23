import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid_value.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/bottom_sheet_provider.dart';
import '../../../../tool/input_validator.dart';
import '../../../user/bloc/user_bloc.dart';
import '../exercise_list.dart';
import 'exercise_form.dart';

class TrainingForm extends StatefulWidget {
  const TrainingForm({
    required this.onFormApply,
    required this.actionButtonText,
    this.initialTraining,
    super.key,
  });

  final Training? initialTraining;
  final void Function(Training training) onFormApply;
  final String actionButtonText;

  @override
  State<TrainingForm> createState() => _TrainingFormState();
}

class _TrainingFormState extends State<TrainingForm> {
  final _formKey = GlobalKey<FormState>();

  late Training _newTraining;

  @override
  void initState() {
    super.initState();

    _newTraining = widget.initialTraining ?? Training.empty();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseListHeight = MediaQuery.sizeOf(context).shortestSide;
    final text = S.of(context);
    final exerciseListContainerDecoration = BoxDecoration(
      color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
    );

    const buttonsPadding = EdgeInsets.symmetric(horizontal: 5);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                TextFormField(
                  initialValue: _newTraining.title,
                  onSaved: _saveTitleField,
                  validator: InputValidator(s: text).titleValidator,
                  decoration: InputDecoration(
                    labelText: text.newTrainingTitle,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  initialValue: _newTraining.description,
                  onSaved: _saveDescriptionField,
                  decoration: InputDecoration(
                    labelText: text.newTrainingDescriptionOptional,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: exerciseListHeight,
              decoration: exerciseListContainerDecoration,
              child: ExerciseList.editable(
                exercises: _newTraining.exercises,
                onDeletePressed: _deleteExerciseFromList,
                onEdited: _editExercise,
                exercisesAbsenceTitle: text.noExercisesYetPress,
                itemDimension: exerciseListHeight * 0.8,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: buttonsPadding,
                  child: OutlinedButton(
                    onPressed: () async => _openExerciseCreationModal(),
                    child: Text(
                      text.addExercise,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: buttonsPadding,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: _applyButtonBuilder,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _applyChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      widget.onFormApply(_newTraining);

      if (widget.initialTraining == null) {
        _newTraining = Training.empty();
        _formKey.currentState?.reset();
      }
    }
  }

  Future<void> _openExerciseCreationModal() async {
    final text = S.of(context);

    await showVoidModalBottomSheet(
      context: context,
      headerText: text.createANewExercise,
      content: ExerciseForm(
        onFormApply: _addExercise,
        actionButtonText: text.addExercise,
      ),
    );
  }

  void _addExercise(Exercise newExercise) {
    setState(() {
      _newTraining = _newTraining.copyWith(
        exercises: [newExercise, ..._newTraining.exercises],
      );
    });

    _closeExerciseCreationModal();
  }

  void _closeExerciseCreationModal() => Navigator.pop(context);

  void _saveTitleField(String? input) {
    _newTraining = _newTraining.copyWith(title: input!.trim());
  }

  void _saveDescriptionField(String? input) {
    _newTraining = _newTraining.copyWith(
      description: input == null || input.trim().isEmpty ? null : input.trim(),
    );
  }

  void _editExercise(Exercise newExercise) {
    final editedExercises = _newTraining.exercises
        .map(
          (exercise) => exercise.id == newExercise.id ? newExercise : exercise,
        )
        .toList();

    setState(() {
      _newTraining = _newTraining.copyWith(exercises: editedExercises);
    });

    _closeExerciseCreationModal();
  }

  void _deleteExerciseFromList(UuidValue exerciseId) {
    final currentExercises = List<Exercise>.from(_newTraining.exercises)
      ..removeWhere(
        (exercise) => exercise.id == exerciseId,
      );

    setState(() {
      _newTraining = _newTraining.copyWith(exercises: currentExercises);
    });
  }

  Widget _applyButtonBuilder(BuildContext context, UserState state) {
    if (state.status == UserStatus.loading) {
      return const CircularProgressIndicator();
    }
    return OutlinedButton(
      onPressed: _applyChanges,
      child: Text(
        widget.actionButtonText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
