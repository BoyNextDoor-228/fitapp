/// To be thrown, whenever current exercise load type is not a subtype or an
/// implementation of an abstract exercise load type.
class UnknownExerciseLoadTypeException implements Exception {
  @override
  String toString() => 'Unknown ExerciseLoadType used.';
}
