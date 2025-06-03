import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class DurationPicker extends StatefulWidget {
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

  Future<void> _showDialog(Widget child) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6),
        margin:
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(top: false, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return _TimerPickerItem(
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
}

class _TimerPickerItem extends StatelessWidget {
  const _TimerPickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      );
}
