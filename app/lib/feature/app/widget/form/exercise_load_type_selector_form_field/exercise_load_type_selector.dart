import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class ExerciseLoadTypeSelector extends StatefulWidget {
  const ExerciseLoadTypeSelector({
    required this.onChanged,
    this.initialLoadType,
    super.key,
  });

  final ExerciseLoadType? initialLoadType;
  final void Function(ExerciseLoadType newLoadType) onChanged;

  @override
  State<ExerciseLoadTypeSelector> createState() =>
      _ExerciseLoadTypeSelectorState();
}

class _ExerciseLoadTypeSelectorState extends State<ExerciseLoadTypeSelector> {
  late ExerciseLoadType _selectedLoadType;

  @override
  void initState() {
    super.initState();

    _selectedLoadType = widget.initialLoadType ?? ExerciseLoadType.repetition;
  }

  @override
  Widget build(BuildContext context) => SegmentedButton<ExerciseLoadType>(
        selected: {_selectedLoadType},
        onSelectionChanged: _changeSelection,
        segments: _buttonSegments(context),
      );

  void _changeSelection(Set<ExerciseLoadType> newSelection) {
    setState(() {
      _selectedLoadType = newSelection.single;
    });

    widget.onChanged(_selectedLoadType);
  }

  List<ButtonSegment<ExerciseLoadType>> _buttonSegments(BuildContext context) {
    final text = S.of(context);

    return [
      ButtonSegment(
        label: Text(text.reps),
        icon: const Icon(Icons.onetwothree),
        value: ExerciseLoadType.repetition,
      ),
      ButtonSegment(
        label: Text(text.timer),
        icon: const Icon(Icons.timer),
        value: ExerciseLoadType.timer,
      ),
    ];
  }
}
