extension DateToDdMmYyHhMmString on DateTime {
  /// Turns [DateTime] object into a date-time [String] with format
  /// "DayOrderNumber.MonthOrderNumber.Year\nHour:Minute"
  ///
  /// Example:
  /// ``` dart
  /// final currentDateTime =
  ///   DateTime.utc(2000, 1, 1, 10, 30, 40); // January 1st, 2000, 10:30:40
  ///
  /// print(currentDateTime.toDdMmYyHhMm()); // '1.1.2000\n10:30'
  /// ```
  String toDdMmYyHhMm() => '$day.$month.$year\n$hour:$minute';
}
