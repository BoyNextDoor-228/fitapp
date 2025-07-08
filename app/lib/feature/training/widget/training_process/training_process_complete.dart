import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid_value.dart';

import '../../../../generated/l10n.dart';
import '../../../../tool/route_provider.dart';
import '../../../navigation/app_router.dart';
import '../../../user/bloc/user_bloc.dart';

class TrainingProcessCompleteWidget extends StatefulWidget {
  const TrainingProcessCompleteWidget({
    required this.trainingId,
    super.key,
  });

  final UuidValue trainingId;

  @override
  State<TrainingProcessCompleteWidget> createState() =>
      TrainingProcessCompleteWidgetState();
}

class TrainingProcessCompleteWidgetState
    extends State<TrainingProcessCompleteWidget> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  final _animationDuration = Durations.long2;
  final _animationCurve = Curves.easeInCubic;

  late final Animation<double> _opacity;

  late final Animation<AlignmentGeometry> _buttonAlignment;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
    if (mounted) {
      _animationController.forward();
    }

    final animation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0, 1, curve: _animationCurve),
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animation);

    _buttonAlignment = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.center,
    ).animate(animation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final router = context.router;

    final currentExercises = context
        .watch<UserBloc>()
        .state
        .user!
        .trainings
        .where((training) => training.id == widget.trainingId)
        .single
        .exercises;

    const iconWidget = Icon(
      Icons.thumb_up,
      size: 200,
    );

    final completionTextLabelWidget = Text(
      text.goodWorknYourTrainingProgressHasBeenUpdated,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      style: textTheme.headlineSmall,
    );

    final goToStatisticsButton = OutlinedButton(
      onPressed: () async => goToRoute(
        router: router,
        route: ExerciseStatisticsRoute(exercises: currentExercises),
      ),
      child: Text(text.checkStatistics),
    );

    return isLandscape
        ? AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => Row(
              children: [
                Opacity(
                  opacity: _opacity.value,
                  child: iconWidget,
                ),
                Expanded(
                  child: Column(
                    spacing: 30,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      completionTextLabelWidget,
                      Container(
                        alignment: _buttonAlignment.value,
                        child: Opacity(
                          opacity: _opacity.value,
                          child: goToStatisticsButton,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                Opacity(
                  opacity: _opacity.value,
                  child: iconWidget,
                ),
                completionTextLabelWidget,
                Container(
                  alignment: _buttonAlignment.value,
                  child: Opacity(
                    opacity: _opacity.value,
                    child: goToStatisticsButton,
                  ),
                ),
              ],
            ),
          );
  }
}
