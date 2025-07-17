class Ticker {
  /// Implements countdown ticker.
  ///
  /// Starts counting down from [duration] with period 1 second.
  const Ticker({required this.duration});

  final Duration duration;
  static const _oneSecond = Duration(seconds: 1);

  /// Returns a [Stream], which imitates counting down ticker behaviour.
  ///
  /// Emits a new [Duration] every 1 second during time, passed in [duration].
  Stream<Duration> tick({required Duration duration}) => Stream.periodic(
        _oneSecond,
        _subtractOneSecond,
      ).take(duration.inSeconds);

  Duration _subtractOneSecond(int elapsedSeconds) =>
      duration - Duration(seconds: elapsedSeconds) - _oneSecond;
}
