import 'package:fitapp_domain/domain.dart';

import '../exception/unknown_exercise_load_type_exception.dart';
import '../feature/app/extension/duration_to_hhmmss_string.dart';
import '../generated/l10n.dart';

/// Turns [ExerciseLoad] into a [String] and returns it.
///
/// [sets] is the amount of sets in this exercise.
/// [load] is physical load of this exercise.
/// [text] is the localization tool.
///
/// Example:
/// ``` dart
/// final text = S.of(context);
/// const load = Repetition(repsAmount: 12);
///
/// // will print '3 set(s) of 12 rep(s)'
/// print(turnExerciseLoadToText(3, load, text));
/// ```
String turnExerciseLoadToText(int sets, ExerciseLoad load, S text) {
  if (load is Timer) {
    return text.setsSetsOfDuration(sets, load.duration.toHhMmSs());
  }

  if (load is Repetition) {
    return text.setsSetsOfNReps(sets, load.repsAmount);
  }

  throw UnknownExerciseLoadTypeException();
}
