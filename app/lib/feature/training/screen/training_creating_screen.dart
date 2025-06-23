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
import '../widget/form/training_form.dart';

@RoutePage()
class TrainingCreatingScreen extends StatelessWidget {
  const TrainingCreatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(
        title: text.newTraining,
        backRoute: const TrainingListRoute(),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: userStateListener,
        child: ScrollableContentWrapper(
          child: Column(
            children: [
              Text(
                text.fillTheFormToCreateANewTraining,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Expanded(child: _TrainingCreatingForm()),
            ],
          ),
        ),
      ),
    );
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
      actionButtonText: text.createTraining,
      onFormApply: addTraining,
    );
  }
}
