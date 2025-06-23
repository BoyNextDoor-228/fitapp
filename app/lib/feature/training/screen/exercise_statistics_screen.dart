import 'package:auto_route/annotations.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../app/widget/fitapp_appbar.dart';
import '../../app/widget/fitapp_drawer.dart';
import '../../app/widget/fitapp_scaffold.dart';
import '../../navigation/app_router.dart';
import '../widget/exercise_statistics_list_item.dart';

@RoutePage()
class ExerciseStatisticsScreen extends StatelessWidget {
  // Look at example: https://pub.dev/packages/auto_route#passing-arguments
  // ignore: use_key_in_widget_constructors
  const ExerciseStatisticsScreen({required this.exercises});

  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    return FitAppScaffold(
      appBar: FitappAppbar.innerPage(
        title: text.exercisesStatistics,
        backRoute: const TrainingListRoute(),
      ),
      drawer: const FitAppDrawer(),
      body: exercises.isEmpty
          ? Center(
              child: Text(text.exercisesAreAbsent),
            )
          : ListView.separated(
              itemCount: exercises.length,
              separatorBuilder: (_, __) => const SizedBox(
                height: 20,
              ),
              itemBuilder: (_, index) => ExerciseStatisticsListItem(
                exercise: exercises[index],
              ),
            ),
    );
  }
}
