extension DurationToHhmmssString on Duration {
  String toHHMMSS() => toString().substring(0, toString().lastIndexOf('.'));
}
