import 'package:json_annotation/json_annotation.dart';

import '../training/exercise_load/exercise_load.dart';

/// Helps [JsonSerializable] to convert [ExerciseLoad] type.
class ExerciseLoadConverter
    implements JsonConverter<ExerciseLoad, Map<String, dynamic>> {
  const ExerciseLoadConverter();

  @override
  ExerciseLoad fromJson(Map<String, dynamic> value) =>
      ExerciseLoad.fromJson(value);

  @override
  Map<String, dynamic> toJson(ExerciseLoad value) => value.toJson();
}
