import 'package:fitapp_domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../exception/unknown_exercise_load_type_exception.dart';
import '../../../generated/l10n.dart';
import '../../app/extension/date_to_ddmmyy_hhmm_string.dart';
import 'plane_graph/plane_graph.dart';

class ExerciseStatisticsListItem extends StatelessWidget {
  /// Creates a visual view of [ExerciseStatistic] of [exercise].
  ExerciseStatisticsListItem({
    required this.exercise,
    super.key,
  }) {
    _dates = exercise.statistics
        .map(
          (stats) => stats.date.toDdMmYyHhMm(),
        )
        .toList();

    _load = exercise.statistics.map(
      (stats) {
        if (stats.load.type == ExerciseLoadType.timer) {
          return (stats.load as Timer).duration.inSeconds;
        }
        if (stats.load.type == ExerciseLoadType.repetition) {
          return (stats.load as Repetition).repsAmount;
        }

        throw UnknownExerciseLoadTypeException();
      },
    ).toList();
  }

  final Exercise exercise;

  /// Dates, when exercises were done.
  late final List<String> _dates;

  /// Loads of exercises.
  late final List<int> _load;

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);

    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    const textPadding = 10.0;

    /// Label, describing Y-axis scale.
    final yScaleText =
        exercise.load.type == ExerciseLoadType.timer ? text.timer : text.reps;

    final graphWidth = size.width * exercise.statistics.length;
    final graphHeight = size.height * 0.6;

    final graphBackgroundColor = colorScheme.primary;

    final gridColor = colorScheme.onPrimary;
    final scaleLineColor = gridColor;

    final lineColor = colorScheme.primaryContainer;

    return Column(
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: textPadding),
          child: Text(
            text.statisticsOfExercisetitle(exercise.title),
            style: textStyle.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (exercise.statistics.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: textPadding),
            child: Text(
              style: textStyle.bodyLarge,
              text.noStatisticsForThisExerciseYetntoMakeStatisticsOfThis,
              textAlign: TextAlign.center,
            ),
          )
        else
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: PlaneGraph(
              width: graphWidth,
              height: graphHeight,
              backgroundColor: graphBackgroundColor,
              gridColor: gridColor,
              lineColor: lineColor,
              yScaleOffset: size.width * 0.3,
              scaleLineWidth: 2,
              scaleLineColor: scaleLineColor,
              xLabel: text.date,
              yLabel: yScaleText,
              yValueAsDuration: exercise.load.type == ExerciseLoadType.timer,
              xValueAsDuration: true,
              xValues: _dates,
              yValues: _load,
            ),
          ),
      ],
    );
  }
}
