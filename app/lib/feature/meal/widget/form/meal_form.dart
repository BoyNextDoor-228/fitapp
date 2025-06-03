import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid_value.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/bottom_sheet_provider.dart';
import '../../../../tool/input_validator.dart';
import '../../../user/bloc/user_bloc.dart';
import '../ingredient_list.dart';
import 'ingredient_form.dart';

class MealForm extends StatefulWidget {
  const MealForm({
    required this.onFormApply,
    required this.actionButtonText,
    this.initialMeal,
    super.key,
  });

  final Meal? initialMeal;
  final void Function(Meal meal) onFormApply;
  final String actionButtonText;

  @override
  State<MealForm> createState() => _MealFormState();
}

class _MealFormState extends State<MealForm> {
  final _formKey = GlobalKey<FormState>();

  late Meal _newMeal;

  @override
  void initState() {
    super.initState();

    _newMeal = widget.initialMeal ?? Meal.empty();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseListHeight = MediaQuery.sizeOf(context).height / 3;
    final text = S.of(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              initialValue: _newMeal.title,
              onSaved: _saveTitleField,
              validator: InputValidator(s: text).titleValidator,
              decoration: InputDecoration(
                labelText: text.newMealTitle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              initialValue: _newMeal.recipe,
              onSaved: _saveRecipeField,
              decoration: InputDecoration(
                labelText: text.newMealRecipeOptional,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: exerciseListHeight,
            child: IngredientList.editable(
              ingredients: _newMeal.ingredients,
              onDeletePressed: _deleteIngredientFromList,
              onEdited: _editIngredient,
              ingredientAbsenceTitle: text.noIngredientsYet,
              itemDimension: exerciseListHeight,
            ),
          ),
          OutlinedButton(
            onPressed: () async {
              final newIngredient = await _openIngredientCreationModal(context);
              if (newIngredient == null) {
                return;
              }

              _addIngredient(newIngredient);
            },
            child: Text(text.addIngredient),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: _applyButtonBuilder,
          ),
        ],
      ),
    );
  }

  void _applyChanges() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      widget.onFormApply(_newMeal);

      if (widget.initialMeal == null) {
        _newMeal = Meal.empty();
        _formKey.currentState?.reset();
      }
    }
  }

  Future<Ingredient?> _openIngredientCreationModal(
    BuildContext modalContext,
  ) async {
    final text = S.of(context);

    return showBottomSheetWithResultOf<Ingredient>(
      context: modalContext,
      headerText: text.createANewIngredient,
      content: IngredientForm(
        onFormApply: _addIngredient,
        actionButtonText: text.addIngredient,
      ),
    );
  }

  void _addIngredient(Ingredient newIngredient) {
    setState(() {
      _newMeal = _newMeal.copyWith(
        ingredients: [..._newMeal.ingredients, newIngredient],
      );
    });
  }

  void _saveTitleField(String? input) {
    _newMeal = _newMeal.copyWith(title: input!.trim());
  }

  void _saveRecipeField(String? input) {
    _newMeal = _newMeal.copyWith(
      recipe: input == null || input.trim().isEmpty ? null : input.trim(),
    );
  }

  void _editIngredient(Ingredient newIngredient) {
    final editedIngredients = _newMeal.ingredients
        .map(
          (ingredient) => ingredient.product.id == newIngredient.product.id
              ? newIngredient
              : ingredient,
        )
        .toList();

    setState(() {
      _newMeal = _newMeal.copyWith(ingredients: editedIngredients);
    });
  }

  void _deleteIngredientFromList(UuidValue productId) {
    final currentIngredients = List<Ingredient>.from(_newMeal.ingredients)
      ..removeWhere(
        (ingredient) => ingredient.product.id == productId,
      );

    setState(() {
      _newMeal = _newMeal.copyWith(ingredients: currentIngredients);
    });
  }

  Widget _applyButtonBuilder(BuildContext context, UserState state) {
    if (state.status == UserStatus.loading) {
      return const CircularProgressIndicator();
    }
    return OutlinedButton(
      onPressed: _applyChanges,
      child: Text(widget.actionButtonText),
    );
  }
}
