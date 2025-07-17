import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/input_validator.dart';
import '../../../meal/widget/form/measurement_unit_selector_form_field/measurement_unit_selector_form_field.dart';
import '../../../user/bloc/user_bloc.dart';

class ProductForm extends StatefulWidget {
  /// Creates a [Form], which produces a [Product].
  ///
  /// [onFormApply] is a callback, which is called on this form successful apply.
  /// [actionButtonText] is a text to be displayed on form applying button.
  /// If [initialProduct] is passed, form fields will be filled with this
  /// product data.
  const ProductForm({
    required this.onFormApply,
    required this.actionButtonText,
    this.initialProduct,
    super.key,
  });

  final Product? initialProduct;
  final void Function(Product training) onFormApply;
  final String actionButtonText;

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  late Product _newProduct;

  @override
  void initState() {
    super.initState();

    _newProduct = widget.initialProduct ?? Product.empty();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    final validator = InputValidator(s: text);
    final titleValidator = validator.titleValidator;
    final fractionalNumberValidator = validator.fractionalNumberValidator;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 10,
          children: [
            TextFormField(
              initialValue: _newProduct.name,
              onSaved: _saveTitleField,
              validator: titleValidator,
              decoration: InputDecoration(
                labelText: text.newProductName,
              ),
            ),
            TextFormField(
              initialValue: _newProduct.nutritionFacts.proteins.toString(),
              keyboardType: TextInputType.number,
              onSaved: _saveProteinsField,
              validator: fractionalNumberValidator,
              decoration: InputDecoration(
                labelText: text.proteinsAmount,
              ),
            ),
            TextFormField(
              initialValue: _newProduct.nutritionFacts.fats.toString(),
              keyboardType: TextInputType.number,
              onSaved: _saveFatsField,
              validator: fractionalNumberValidator,
              decoration: InputDecoration(
                labelText: text.fatsAmount,
              ),
            ),
            TextFormField(
              initialValue: _newProduct.nutritionFacts.carbohydrates.toString(),
              keyboardType: TextInputType.number,
              onSaved: _saveCarbohydratesField,
              validator: fractionalNumberValidator,
              decoration: InputDecoration(
                labelText: text.carbohydratesAmount,
              ),
            ),
            TextFormField(
              initialValue: _newProduct.nutritionFacts.kilocalories.toString(),
              keyboardType: TextInputType.number,
              onSaved: _saveKilocaloriesField,
              validator: fractionalNumberValidator,
              decoration: InputDecoration(
                labelText: text.kilocaloriesAmount,
              ),
            ),
            MeasurementUnitSelectorFormField(
              initialMeasurementUnit: _newProduct.measurementUnit,
              onChanged: (unit) {
                setState(() {
                  _newProduct = _newProduct.copyWith(measurementUnit: unit);
                });
              },
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: _applyButtonBuilder,
            ),
          ],
        ),
      ),
    );
  }

  Widget _applyButtonBuilder(
    BuildContext context,
    UserState state,
  ) {
    if (state.status == UserStatus.loading) {
      return const CircularProgressIndicator();
    }
    return OutlinedButton(
      onPressed: _applyChanges,
      child: Text(widget.actionButtonText),
    );
  }

  void _applyChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      widget.onFormApply(_newProduct);

      if (widget.initialProduct == null) {
        _newProduct = Product.empty();
        _formKey.currentState?.reset();
      }
    }
  }

  void _saveTitleField(String? input) {
    _newProduct = _newProduct.copyWith(name: input!);
  }

  void _saveProteinsField(String? input) {
    _newProduct = _newProduct.copyWith(
      nutritionFacts:
          _newProduct.nutritionFacts.copyWith(proteins: double.parse(input!)),
    );
  }

  void _saveFatsField(String? input) {
    _newProduct = _newProduct.copyWith(
      nutritionFacts:
          _newProduct.nutritionFacts.copyWith(fats: double.parse(input!)),
    );
  }

  void _saveCarbohydratesField(String? input) {
    _newProduct = _newProduct.copyWith(
      nutritionFacts: _newProduct.nutritionFacts
          .copyWith(carbohydrates: double.parse(input!)),
    );
  }

  void _saveKilocaloriesField(String? input) {
    _newProduct = _newProduct.copyWith(
      nutritionFacts: _newProduct.nutritionFacts
          .copyWith(kilocalories: double.parse(input!)),
    );
  }
}
