part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState({required this.duration});

  final Duration duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial({required super.duration});
}

final class TimerRunPaused extends TimerState {
  const TimerRunPaused({required super.duration});
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress({required super.duration});
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(duration: Duration.zero);
}
