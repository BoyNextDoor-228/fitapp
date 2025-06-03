import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/input_validator.dart';

class WeightForm extends StatelessWidget {
  WeightForm({required this.onFormSaved, super.key});

  final _formKey = GlobalKey<FormState>();
  final void Function(double userWeight) onFormSaved;

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
