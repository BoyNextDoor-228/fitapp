import 'package:auto_route/auto_route.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../tool/bottom_sheet_provider.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../navigation/app_router.dart';
import '../../user/bloc/user_bloc.dart';
import '../bloc/training_process/training_process_bloc.dart';
import '../widget/training_process/training_process.dart';

@RoutePage()
class TrainingProcessScreen extends StatelessWidget {
  // Look at example: https://pub.dev/packages/auto_route#passing-arguments
  // ignore: use_key_in_widget_constructors
  TrainingProcessScreen({required this.training})
      : _trainingProcessBloc = TrainingProcessBloc(training: training);

  final Training training;
  final TrainingProcessBloc _trainingProcessBloc;

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();

    void startTraining() {
      _trainingProcessBloc
          .add(TrainingProcessStarted(exercises: training.exercises));
    }

    void updateTrainingProgression(Map<Exercise, bool> newProgress) {
      _trainingProcessBloc.add(
        TrainingProcessProgressionUpdated(
          exercisesProgress: newProgress,
        ),
      );
    }

    void finishTraining() {
      _trainingProcessBloc.add(TrainingProcessCompleted());
      userBloc.add(TrainingCompleted(trainingId: training.id));
    }

    return FitAppScaffold(
      appBar: FitappAppbar.innerPage(
        title: training.title,
        backRoute: const TrainingListRoute(),
        trailing: IconButton(
          onPressed: () async => _showTrainingDescription(context),
          icon: const Icon(Icons.info),
        ),
      ),
      drawer: const FitAppDrawer(),
      body: BlocProvider.value(
        value: _trainingProcessBloc,
        child: TrainingProcess(
          training: training,
          startTraining: startTraining,
          updateTrainingProgression: updateTrainingProgression,
          finishTraining: finishTraining,
        ),
      ),
    );
  }

  Future<void> _showTrainingDescription(BuildContext context) async {
    final text = S.of(context);

    await showVoidModalBottomSheet(
      context: context,
      headerText: text.trainingInformation,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text(training.title)),
            const Divider(),
            Center(child: Text(training.description ?? text.noDescription)),
          ],
        ),
      ),
    );
  }
}
