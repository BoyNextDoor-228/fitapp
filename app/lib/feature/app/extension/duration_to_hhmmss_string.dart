extension DurationToHhmmssString on Duration {
  /// Turns [Duration] object into a [String] with format
  /// "hour:minute:second"
  ///
  /// Example:
  /// ``` dart
  /// final duration = Duration(hours: 10, minutes:3, seconds:30);
  ///
  /// print(duration.toHhMmSs()); // '10:03:30'
  /// ```
  String toHhMmSs() => toString().substring(0, toString().lastIndexOf('.'));
}
