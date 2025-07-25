import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/route_provider.dart';
import '../../../tool/user_state_listener.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../app/widget/full_info_displayable_list_item.dart';
import '../../app/widget/navigation_floating_action_button.dart';
import '../../app/widget/shared/empty_list_label.dart';
import '../../app/widget/shared/shimmer_card.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/meal_full_info.dart';
import '../widget/meal_list_item.dart';

@RoutePage()
class MealListScreen extends StatelessWidget {
  const MealListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final bottomSheetHeight = size.height * 0.7;
    final itemHeight = size.longestSide * 0.4;

    final userBloc = context.read<UserBloc>();
    final router = context.router;
    final text = S.of(context);

    return FitAppScaffold(
      floatingActionButton: const NavigationFloatingActionButton(
        route: MealCreatingRoute(),
      ),
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.regularPage(title: text.mealsList),
      body: BlocConsumer<UserBloc, UserState>(
        listener: userStateListener,
        bloc: userBloc,
        builder: (_, state) {
          final isLoading = state.status == UserStatus.loading;

          final meals = state.user!.meals;

          if (meals.isEmpty) {
            return Center(
              child: EmptyListLabel(
                icon: const Icon(
                  Icons.no_meals,
                  size: 100,
                ),
                elementsAbsenceText:
                    text.noMealsYetnPressPlusButtonToCreateANew,
              ),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: meals.length,
            itemBuilder: (_, index) => FullInfoDisplayableListItem(
              listItem: isLoading
                  ? ShimmerCard(cardHeight: itemHeight)
                  : MealListItem(
                      meal: meals[index],
                      index: index + 1,
                      itemDimension: itemHeight,
                      onDelete: () =>
                          userBloc.add(MealDeleted(mealId: meals[index].id)),
                      onEdit: () async => goToRoute(
                        router: router,
                        route: MealEditingRoute(meal: meals[index]),
                      ),
                    ),
              headerText: text.mealInformation,
              content: MealFullInfo(meal: meals[index]),
              height: bottomSheetHeight,
            ),
          );
        },
      ),
    );
  }
}
