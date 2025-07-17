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
import '../widget/training_full_info.dart';
import '../widget/training_list_item.dart';

@RoutePage()
class TrainingListScreen extends StatelessWidget {
  const TrainingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final text = S.of(context);

    final cardHeight = MediaQuery.sizeOf(context).longestSide / 3;

    return FitAppScaffold(
      floatingActionButton: const NavigationFloatingActionButton(
        route: TrainingCreatingRoute(),
      ),
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.regularPage(title: text.trainingsList),
      body: BlocConsumer<UserBloc, UserState>(
        listener: userStateListener,
        builder: (context, state) {
          final isLoading = state.status == UserStatus.loading;

          final trainings = state.user!.trainings;

          if (trainings.isEmpty) {
            return Center(
              child: EmptyListLabel(
                elementsAbsenceText: text.noTrainingsYetNTapPlusIconToCreateA,
              ),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: trainings.length,
            itemBuilder: (context, index) => FullInfoDisplayableListItem(
              listItem: isLoading
                  ? ShimmerCard(cardHeight: cardHeight)
                  : TrainingListItem(
                      training: trainings[index],
                      index: index + 1,
                      cardHeight: cardHeight,
                      onDelete: () => context.read<UserBloc>().add(
                            TrainingDeleted(trainingId: trainings[index].id),
                          ),
                      onEdit: () async => goToRoute(
                        router: router,
                        route: TrainingEditingRoute(training: trainings[index]),
                      ),
                    ),
              headerText: text.trainingInformation,
              content: TrainingFullInfo(training: trainings[index]),
            ),
          );
        },
      ),
    );
  }
}
