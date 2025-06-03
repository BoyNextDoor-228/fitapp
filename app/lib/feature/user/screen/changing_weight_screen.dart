import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
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

    return FitAppScaffold(
      appBar: FitappAppbar.regularPage(title: text.editWeight),
      drawer: const FitAppDrawer(),
      body: BlocListener<UserBloc, UserState>(
        listener: _listenerCallback,
        listenWhen: _listenWhenCallback,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text.hereYouCanChangeYourCurrentWeight,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                WeightForm(
                  onFormSaved: (newWeight) => context
                      .read<UserBloc>()
                      .add(UserWeightUpdated(newWeight: newWeight)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _listenWhenCallback(
    UserState previousState,
    UserState currentState,
  ) =>
      previousState.user!.weight != currentState.user!.weight;

  Future<void> _listenerCallback(BuildContext context, UserState state) async {
    final showSnackBar = ScaffoldMessenger.of(context).showSnackBar;
    final text = S.of(context);

    if (state.status == UserStatus.error) {
      showSnackBar(
        SnackBar(content: Text(state.errorMessage!)),
      );
    }

    if (state.status == UserStatus.success) {
      showSnackBar(
        SnackBar(content: Text(text.weightUpdated)),
      );
      await context.router.popAndPush(const HomeRoute());
    }
  }
}
