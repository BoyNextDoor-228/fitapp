import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/user_state_listener.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../navigation/app_router.dart';
import '../bloc/user_bloc.dart';
import '../widget/form/weight_form.dart';

@RoutePage()
class ChangingWeightScreen extends StatelessWidget {
  const ChangingWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final userBloc = context.read<UserBloc>();
    final textTheme = Theme.of(context).textTheme;

    void updateWeight(double newWeight) =>
        userBloc.add(UserWeightUpdated(newWeight: newWeight));

    return FitAppScaffold(
      appBar: FitappAppbar.innerPage(
        title: text.editWeight,
        backRoute: const HomeRoute(),
      ),
      drawer: const FitAppDrawer(),
      body: BlocConsumer<UserBloc, UserState>(
        listener: userStateListener,
        builder: (_, state) => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text.hereYouCanChangeYourCurrentWeight,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium,
                ),
                WeightForm(
                  onFormSaved: updateWeight,
                  isLoading: state.status == UserStatus.loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
