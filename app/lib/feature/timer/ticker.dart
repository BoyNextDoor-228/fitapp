class Ticker {
  const Ticker({required this.duration});

  final Duration duration;
  static const _oneSecond = Duration(seconds: 1);

  Stream<Duration> tick({required Duration duration}) => Stream.periodic(
        _oneSecond,
        _subtractOneSecond,
      ).take(duration.inSeconds);

  Duration _subtractOneSecond(int elapsedSeconds) =>
      duration - Duration(seconds: elapsedSeconds) - _oneSecond;
}
