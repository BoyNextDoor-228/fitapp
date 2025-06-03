import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/input_validator.dart';
import '../../../user/bloc/user_bloc.dart';
import 'measurement_unit_selector_form_field/measurement_unit_selector_form_field.dart';

class IngredientForm extends StatefulWidget {
  const IngredientForm({
    required this.onFormApply,
    required this.actionButtonText,
    this.initialIngredient,
    super.key,
  });

  final Ingredient? initialIngredient;
  final void Function(Ingredient ingredeint) onFormApply;
  final String actionButtonText;

  @override
  State<IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<IngredientForm> {
  final _formKey = GlobalKey<FormState>();

  late Ingredient _newIngredient;
  late List<DropdownMenuEntry<Product>> _productsEntries;

  @override
  void initState() {
    super.initState();

    _newIngredient = widget.initialIngredient ?? Ingredient.empty();

    _productsEntries = context
        .read<UserBloc>()
        .state
        .user!
        .products
        .map(
          (product) => DropdownMenuEntry(value: product, label: product.name),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownMenu(
            label: Text(text.selectProduct),
            width: double.infinity,
            dropdownMenuEntries: _productsEntries,
            initialSelection: _newIngredient.product,
            onSelected: (product) {
              setState(() {
                _newIngredient = _newIngredient.copyWith(product: product!);
              });
            },
          ),
          MeasurementUnitSelectorFormField(
            initialMeasurementUnit: _newIngredient.measurement,
            onChanged: (unit) {
              setState(() {
                _newIngredient = _newIngredient.copyWith(measurement: unit);
              });
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            onSaved: _saveAmountField,
            validator: InputValidator(s: text).fractionalNumberValidator,
            decoration: InputDecoration(
              labelText: text.enterIngredientAmount,
            ),
          ),
          TextButton(
            onPressed: _applyForm,
            child: Text(widget.actionButtonText),
          ),
        ],
      ),
    );
  }

  void _applyForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      widget.onFormApply(_newIngredient);

      if (widget.initialIngredient == null) {
        _newIngredient = Ingredient.empty();
        _formKey.currentState?.reset();
      }
    }
  }

  void _saveAmountField(String? input) {
    _newIngredient = _newIngredient.copyWith(amount: double.parse(input!));
  }

  // String? _amountValidator(String? input) {
  //   if (input == null || input.trim().isEmpty) {
  //     return 'Enter amount';
  //   }
  //
  //   if (input.split('').first == '.' || input.split('').last == '.') {
  //     return 'Make sure fractional number is correct';
  //   }
  //
  //   final number = double.tryParse(input);
  //
  //   if (number == null) {
  //     return 'Enter valid number';
  //   }
  //
  //   if (number.isNegative) {
  //     return 'Number must be non-negative';
  //   }
  //   return null;
  // }
}
