import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../utils/uuid_value_converter.dart';
import '../exercise/exercise.dart';

part 'training.freezed.dart';
part 'training.g.dart';

@freezed
abstract class Training with _$Training {
  const factory Training._({
    @UuidValueConverter() required UuidValue id,
    required String title,
    required String? description,
    required List<Exercise> exercises,
  }) = _Training;

  /// Creates an empty [Training] with empty [title], [description] and
  /// [exercises] list.
  factory Training.empty() => Training._(
        id: UuidValue.fromString(const Uuid().v1()),
        title: '',
        description: null,
        exercises: [],
      );

  /// Creates a [Training] with specified [title] and optional [description].
  /// Initially [exercises] list is empty.
  factory Training.create({
    required String title,
    required String? description,
  }) =>
      Training._(
        id: UuidValue.fromString(const Uuid().v1()),
        title: title,
        description: description,
        exercises: [],
      );

  factory Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);
}
