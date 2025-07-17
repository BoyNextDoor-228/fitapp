import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class DurationPicker extends StatefulWidget {
  /// Creates a duration picker field.
  ///
  /// On field tap shows iOS-styled duration picked dialog.
  /// If [initialDuration] is passed, form field will be filled with this
  /// duration.
  /// [onChanged] is a callback, which is called on duration picked.
  const DurationPicker({
    required this.initialDuration,
    required this.onChanged,
    super.key,
  });

  final Duration initialDuration;
  final void Function(Duration newDuration) onChanged;

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late Duration _editedDuration;

  @override
  void initState() {
    super.initState();

    _editedDuration = widget.initialDuration;
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text.timer),
        CupertinoButton(
          onPressed: () async => _showDialog(
            CupertinoTimerPicker(
              initialTimerDuration: _editedDuration,
              onTimerDurationChanged: (Duration newDuration) {
                setState(
                  () {
                    _editedDuration = newDuration;
                    widget.onChanged(_editedDuration);
                  },
                );
              },
            ),
          ),
          child: Text(
            '$_editedDuration',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }

  Future<void> _showDialog(Widget child) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        final height = MediaQuery.sizeOf(context).height * 0.5;
        final backgroundColor =
            Theme.of(context).colorScheme.onSecondaryContainer;

        return Container(
          height: height,
          color: backgroundColor,
          child: SafeArea(top: false, child: child),
        );
      },
    );
  }
}
