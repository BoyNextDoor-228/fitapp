import 'package:fitapp_domain/domain.dart';

import '../exception/unknown_exercise_load_type_exception.dart';
import '../feature/app/extension/duration_to_hhmmss_string.dart';
import '../generated/l10n.dart';

String turnExerciseLoadToText(int sets, ExerciseLoad load, S text) {
  if (load is Timer) {
    return text.setsSetsOfDuration(sets, load.duration.toHHMMSS());
  }

  if (load is Repetition) {
    return text.setsSetsOfNReps(sets, load.repsAmount);
  }

  throw UnknownExerciseLoadTypeException();
}
