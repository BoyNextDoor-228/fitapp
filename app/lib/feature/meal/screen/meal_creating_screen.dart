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
class MealCreatingScreen extends StatelessWidget {
  const MealCreatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(
        title: text.newMeal,
        backRoute: const MealListRoute(),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: userStateListener,
        child: ScrollableContentWrapper(
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
      ),
    );
  }
}

class _MealCreatingForm extends StatelessWidget {
  const _MealCreatingForm();

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void addMeal(Meal meal) {
      context.read<UserBloc>().add(MealAdded(newMeal: meal));
    }

    return MealForm(
      actionButtonText: text.createMeal,
      onFormApply: addMeal,
    );
  }
}
