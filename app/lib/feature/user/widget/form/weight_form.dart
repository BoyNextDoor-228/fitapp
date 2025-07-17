import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/input_validator.dart';

class WeightForm extends StatelessWidget {
  /// Creates a [Form], which produces a new user weight data..
  ///
  /// [onFormSaved] is a callback, which is called on this form successful apply.
  /// [isLoading] is a flag, which determines, if a loading process is in
  /// progress, so 'apply' button should be inactive. Default is False.
  WeightForm({
    required this.onFormSaved,
    this.isLoading = false,
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final void Function(double userWeight) onFormSaved;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final text = S.of(context);

    return Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              onFieldSubmitted: _onSaved,
              keyboardType: TextInputType.number,
              onSaved: _onSaved,
              validator: InputValidator(s: text).fractionalNumberValidator,
              decoration: InputDecoration(
                labelText: text.enterYourWeight,
              ),
            ),
          ),
          if (isLoading)
            const CircularProgressIndicator()
          else
            OutlinedButton(
              onPressed: _applyWeight,
              child: Text(
                text.apply,
                style: textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }

  void _applyWeight() {
    _formKey.currentState?.save();
  }

  void _onSaved(String? input) {
    if (_formKey.currentState!.validate()) {
      onFormSaved(double.parse(input!));
    }
  }
}
