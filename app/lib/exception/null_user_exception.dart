class NullUserException implements Exception {
  @override
  String toString() => 'Unable perform any action on user while it is null.';
}
