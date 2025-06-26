import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../generated/l10n.dart';

class CountPicker extends StatefulWidget {
  const CountPicker({
    required this.initialValue,
    required this.labelText,
    required this.onChanged,
    super.key,
  });

  final int initialValue;
  final String labelText;
  final void Function(int newValue) onChanged;

  @override
  State<CountPicker> createState() => _CountPickerState();
}

class _CountPickerState extends State<CountPicker> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller.text = widget.initialValue.toString();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(widget.labelText),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (input) => _applyChanges(input, S.of(context)),
                controller: _controller,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  errorText: _errorText,
                ),
              ),
            ),
          ],
        ),
      );

  void _validateField(String? input, S text) {
    if (input == null || input.trim().isEmpty) {
      _errorText = text.enterIntegerNumber;
      return;
    }

    final count = int.tryParse(input);

    if (count == null) {
      _errorText = text.enterValidIntegerNumber;
      return;
    }

    if (count.isNegative) {
      _errorText = text.numberMustBeNonnegative;
      return;
    }
    _errorText = null;
  }

  void _applyChanges(String? input, S text) {
    _validateField(input, text);
    if (_errorText != null) {
      return;
    }

    final newCount = int.parse(_controller.text);

    widget.onChanged(newCount);
  }
}
