class BadValuePassedException implements Exception {
  BadValuePassedException({required this.description});

  final String description;

  @override
  String toString() => description;
}
