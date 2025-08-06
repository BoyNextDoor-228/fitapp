import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/input_validator.dart';
import '../../../../tool/measurement_unit_to_text.dart';
import '../../../../tool/route_provider.dart';
import '../../../app/widget/shared/empty_list_label.dart';
import '../../../app/widget/shared/nutrition_facts_table.dart';
import '../../../navigation/app_router.dart';
import '../../../user/bloc/user_bloc.dart';

class IngredientForm extends StatefulWidget {
  /// Creates a [Form], which produces an [Ingredient].
  ///
  /// [onFormApply] is a callback, which is called on this form successful apply.
  /// [actionButtonText] is a text to be displayed on form applying button.
  /// If [initialIngredient] is passed, form fields will be filled with this
  /// ingredient data.
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

  /// A ingredient, which this form eventually produces.
  late Ingredient? _newIngredient;

  /// Entries for dropdown menu, which describe products, that are available to
  /// be used for creating an ingredient.
  late List<DropdownMenuEntry<Product>> _productsEntries;

  @override
  void initState() {
    super.initState();

    _newIngredient = widget.initialIngredient;

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
    final router = context.router;
    final text = S.of(context);

    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    final height = MediaQuery.sizeOf(context).height;

    final dropdownMenuHeight = isLandscape ? height * 0.6 : height / 3;

    final textStyle = Theme.of(context).textTheme;

    Future<void> redirectToProductCreatingForm() async => goToRoute(
          router: router,
          route: const ProductRootRoute(),
        );

    if (_productsEntries.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          EmptyListLabel(
            icon: const Icon(Icons.no_food, size: 100),
            elementsAbsenceText: text.noProductsncreateAProductFirstToAddItAsAn,
          ),
          OutlinedButton(
            onPressed: redirectToProductCreatingForm,
            child: Text(
              text.goToProducts,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // if CREATING a new ingredient.
            if (widget.initialIngredient == null)
              DropdownMenu(
                label: Text(text.selectProduct),
                width: double.infinity,
                menuHeight: dropdownMenuHeight,
                dropdownMenuEntries: _productsEntries,
                initialSelection: _newIngredient?.product,
                onSelected: _updateIngredient,
              )
            else // else EDITING an ingredient.
              Text(
                widget.initialIngredient!.product.name,
                style: textStyle.headlineMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

            // if ingredient is null, it can not have a product, so product's
            // nutrition facts are zeros.
            if (_newIngredient == null)
              const NutritionFactsTable.empty()
            else // else display ingredient product's info.
              Column(
                children: [
                  Text(
                    text.hundredMeasurementContain(
                      measurementUnitToText(
                        _newIngredient!.product.measurementUnit,
                        text,
                      ),
                    ),
                    style: textStyle.headlineSmall,
                  ),
                  NutritionFactsTable(
                    proteins: _newIngredient!.product.nutritionFacts.proteins,
                    fats: _newIngredient!.product.nutritionFacts.fats,
                    carbohydrates:
                        _newIngredient!.product.nutritionFacts.carbohydrates,
                    kilocalories:
                        _newIngredient!.product.nutritionFacts.kilocalories,
                  ),
                ],
              ),

            TextFormField(
              initialValue: _newIngredient?.amount.toString(),
              keyboardType: TextInputType.number,
              onSaved: _saveAmountField,
              validator: InputValidator(s: text).fractionalNumberValidator,
              decoration: InputDecoration(
                labelText: text.enterIngredientAmount,
              ),
            ),
            TextButton(
              onPressed: _newIngredient == null ? null : _applyForm,
              child: Text(widget.actionButtonText),
            ),
          ],
        ),
      ),
    );
  }

  void _updateIngredient(Product? product) {
    setState(() {
      if (_newIngredient == null) {
        _newIngredient = Ingredient.empty().copyWith(product: product!);
      } else {
        _newIngredient = _newIngredient!.copyWith(product: product!);
      }
    });
  }

  void _applyForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      widget.onFormApply(_newIngredient!);

      if (widget.initialIngredient == null) {
        _newIngredient = Ingredient.empty();
        _formKey.currentState?.reset();
      }
    }
  }

  void _saveAmountField(String? input) {
    _newIngredient = _newIngredient!.copyWith(amount: double.parse(input!));
  }
}
