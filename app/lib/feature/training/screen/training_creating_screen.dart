import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../user/bloc/user_bloc.dart';
import '../widget/form/training_form.dart';

@RoutePage()
class TrainingCreatingScreen extends StatelessWidget {
  const TrainingCreatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(title: text.newTraining),
      body: BlocListener<UserBloc, UserState>(
        listenWhen: _listenWhenCallback,
        listener: _listenerCallback,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  text.fillTheFormToCreateANewTraining,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const _TrainingCreatingForm(),
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
      previousState.user!.trainings.length <
      currentState.user!.trainings.length;

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
        SnackBar(content: Text(text.trainingAdded)),
      );
      context.router.pop();
    }
  }
}

class _TrainingCreatingForm extends StatelessWidget {
  const _TrainingCreatingForm();

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void addTraining(Training training) {
      context.read<UserBloc>().add(
            TrainingAdded(
              newTraining: training,
            ),
          );
    }

    return TrainingForm(
      actionButtonText: text.create,
      onFormApply: addTraining,
    );
  }
}
