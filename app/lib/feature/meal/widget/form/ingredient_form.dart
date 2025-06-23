import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/input_validator.dart';
import '../../../../tool/route_provider.dart';
import '../../../app/widget/shared/empty_list_label.dart';
import '../../../navigation/app_router.dart';
import '../../../user/bloc/user_bloc.dart';

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
    final router = context.router;
    final text = S.of(context);

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
}
