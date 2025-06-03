import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../ticker.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({required Duration duration})
      : _initialDuration = duration,
        super(TimerInitial(duration: duration)) {
    on<TimerStarted>(_onTimerStarted);
    on<TimerPaused>(_onTimerPaused);
    on<TimerResumed>(_onTimerResumed);
    on<TimerReset>(_onTimerReset);
    on<_TimerTicked>(_onTimerTicked);
  }

  final Duration _initialDuration;
  StreamSubscription<Duration>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Future<void> _onTimerStarted(
    TimerStarted event,
    Emitter<TimerState> emit,
  ) async {
    emit(TimerRunInProgress(duration: event.duration));
    await _tickerSubscription?.cancel();
    _tickerSubscription = Ticker(duration: _initialDuration)
        .tick(duration: event.duration)
        .listen(
          (duration) => add(_TimerTicked(duration: duration)),
        );
  }

  void _onTimerPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is! TimerRunInProgress) {
      return;
    }
    _tickerSubscription?.pause();
    emit(TimerRunPaused(duration: state.duration));
  }

  void _onTimerResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is! TimerRunPaused) {
      return;
    }

    _tickerSubscription?.resume();
    emit(TimerRunInProgress(duration: state.duration));
  }

  Future<void> _onTimerReset(TimerReset event, Emitter<TimerState> emit) async {
    await _tickerSubscription?.cancel();

    emit(TimerInitial(duration: _initialDuration));
  }

  void _onTimerTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > Duration.zero
          ? TimerRunInProgress(duration: event.duration)
          : const TimerRunComplete(),
    );
  }
}
