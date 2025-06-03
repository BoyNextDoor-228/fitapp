import 'package:freezed_annotation/freezed_annotation.dart';

enum MeasurementUnit {
  @JsonValue('milliliters')
  milliliters,
  @JsonValue('grams')
  grams,
}
