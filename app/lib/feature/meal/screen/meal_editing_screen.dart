import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/user_state_listener.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/shared/scrollable_content_wrapper.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/form/meal_form.dart';

@RoutePage()
class MealEditingScreen extends StatelessWidget {
  // Look at example: https://pub.dev/packages/auto_route#passing-arguments
  // ignore: use_key_in_widget_constructors
  const MealEditingScreen({required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(
        title: text.editMeal,
        backRoute: const MealListRoute(),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: userStateListener,
        child: ScrollableContentWrapper(
          child: Column(
            children: [
              Text(
                text.fillTheFormToEditMeal,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: _MealEditingForm(oldMeal: meal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MealEditingForm extends StatelessWidget {
  const _MealEditingForm({required this.oldMeal});

  final Meal oldMeal;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void editMealCallback(Meal meal) {
      context.read<UserBloc>().add(
            MealEdited(editedMeal: meal),
          );
    }

    return MealForm(
      initialMeal: oldMeal,
      onFormApply: editMealCallback,
      actionButtonText: text.saveChanges,
    );
  }
}
