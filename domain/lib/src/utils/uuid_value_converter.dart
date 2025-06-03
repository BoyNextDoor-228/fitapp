import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

/// Helps [JsonSerializable] to convert UUID type
class UuidValueConverter implements JsonConverter<UuidValue, String> {
  /// Constant constructor that is used by [JsonSerializable]
  const UuidValueConverter();

  @override
  UuidValue fromJson(String value) => UuidValue.fromString(value);

  @override
  String toJson(UuidValue value) => value.uuid;
}
