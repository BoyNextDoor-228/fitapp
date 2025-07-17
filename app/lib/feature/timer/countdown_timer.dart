import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/extension/duration_to_hhmmss_string.dart';
import 'bloc/timer_bloc.dart';

class CountdownTimer extends StatelessWidget {
  /// Creates a widget, that represents countdown timer.
  ///
  /// [duration] is a time, which timer starts counting down from.
  CountdownTimer({
    required Duration duration,
    super.key,
  }) : _timerBloc = TimerBloc(duration: duration);

  final TimerBloc _timerBloc;

  void _startTimer() =>
      _timerBloc.add(TimerStarted(duration: _timerBloc.state.duration));

  void _pauseTimer() => _timerBloc.add(const TimerPaused());

  void _resetTimer() => _timerBloc.add(const TimerReset());

  void _resumeTimer() => _timerBloc.add(const TimerResumed());

  bool _buildWhen(TimerState prevState, TimerState currState) =>
      (prevState.runtimeType != currState.runtimeType) ||
      (prevState.duration != currState.duration);

  @override
  Widget build(BuildContext context) => BlocBuilder<TimerBloc, TimerState>(
        bloc: _timerBloc,
        buildWhen: _buildWhen,
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.duration.toHhMmSs(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...switch (state) {
                  TimerInitial() => [
                      FloatingActionButton(
                        onPressed: _startTimer,
                        child: const Icon(Icons.play_arrow),
                      ),
                    ],
                  TimerRunInProgress() => [
                      FloatingActionButton(
                        onPressed: _pauseTimer,
                        child: const Icon(Icons.pause),
                      ),
                      FloatingActionButton(
                        onPressed: _resetTimer,
                        child: const Icon(Icons.replay),
                      ),
                    ],
                  TimerRunPaused() => [
                      FloatingActionButton(
                        onPressed: _resumeTimer,
                        child: const Icon(Icons.play_arrow),
                      ),
                      FloatingActionButton(
                        onPressed: _resetTimer,
                        child: const Icon(Icons.replay),
                      ),
                    ],
                  TimerRunComplete() => [
                      FloatingActionButton(
                        onPressed: _resetTimer,
                        child: const Icon(Icons.replay),
                      ),
                    ]
                },
              ],
            ),
          ],
        ),
      );
}
