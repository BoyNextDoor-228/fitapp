/// To be thrown, whenever procedure/function receives value as argument, which
/// can not be used in further work.
///
/// Pass [description] to describe, why this value can not be accepted.
class BadValuePassedException implements Exception {
  BadValuePassedException({required this.description});

  final String description;

  @override
  String toString() => description;
}
