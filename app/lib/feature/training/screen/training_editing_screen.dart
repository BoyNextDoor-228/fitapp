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
class TrainingEditingScreen extends StatelessWidget {
  // Look at example: https://pub.dev/packages/auto_route#passing-arguments
  // ignore: use_key_in_widget_constructors
  const TrainingEditingScreen({
    required this.training,
  });

  final Training training;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return FitAppScaffold(
      drawer: const FitAppDrawer(),
      appBar: FitappAppbar.innerPage(
        title: text.editTraining,
        backRoute: const TrainingListRoute(),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: userStateListener,
        child: ScrollableContentWrapper(
          child: Column(
            children: [
              Text(
                text.fillTheFormToEditTraining,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: _TrainingEditingForm(
                  oldTraining: training,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrainingEditingForm extends StatelessWidget {
  const _TrainingEditingForm({required this.oldTraining});

  final Training oldTraining;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    void editTraining(Training training) {
      context.read<UserBloc>().add(TrainingEdited(editedTraining: training));
    }

    return TrainingForm(
      initialTraining: oldTraining,
      onFormApply: editTraining,
      actionButtonText: text.saveChanges,
    );
  }
}
