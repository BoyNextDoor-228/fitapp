extension DateToDdmmyyHhmmString on DateTime {
  String toDdMmYyHhMm() => '$day.$month.$year\n$hour:$minute';
}
