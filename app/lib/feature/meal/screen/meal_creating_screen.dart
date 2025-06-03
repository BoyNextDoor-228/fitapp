import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/form/meal_form.dart';

@RoutePage()
class MealCreatingScreen extends StatelessWidget {
  const MealCreatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return FitAppScaffold(
      resizeToAvoidBottomInset: false,
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(title: text.newMeal),
      body: BlocListener<UserBloc, UserState>(
        listenWhen: _listenWhenCallback,
        listener: _listenerCallback,
        child: Column(
          children: [
            Text(
              text.fillTheFormToCreateANewMeal,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Expanded(
              child: _MealCreatingForm(),
            ),
          ],
        ),
      ),
    );
  }

  bool _listenWhenCallback(
    UserState previousState,
    UserState currentState,
  ) =>
      previousState.user!.meals.length < currentState.user!.meals.length;

  void _listenerCallback(BuildContext context, UserState state) {
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar;
    final text = S.of(context);

    if (state.status == UserStatus.error) {
      showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
    }

    if (state.status == UserStatus.success) {
      showSnackBar(
        SnackBar(content: Text(text.mealAdded)),
      );
      context.router.pop();
    }
  }
}

class _MealCreatingForm extends StatelessWidget {
  const _MealCreatingForm();

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void addMeal(Meal meal) {
      context.read<UserBloc>().add(
            MealAdded(
              newMeal: meal,
            ),
          );
    }

    return MealForm(
      actionButtonText: text.create,
      onFormApply: addMeal,
    );
  }
}
