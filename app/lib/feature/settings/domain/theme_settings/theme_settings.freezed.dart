// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeSettings {
  ThemeBrightness get brightness;
  int get color;
  double get contrastLevel;

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThemeSettingsCopyWith<ThemeSettings> get copyWith =>
      _$ThemeSettingsCopyWithImpl<ThemeSettings>(
          this as ThemeSettings, _$identity);

  /// Serializes this ThemeSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeSettings &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.contrastLevel, contrastLevel) ||
                other.contrastLevel == contrastLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, brightness, color, contrastLevel);

  @override
  String toString() {
    return 'ThemeSettings(brightness: $brightness, color: $color, contrastLevel: $contrastLevel)';
  }
}

/// @nodoc
abstract mixin class $ThemeSettingsCopyWith<$Res> {
  factory $ThemeSettingsCopyWith(
          ThemeSettings value, $Res Function(ThemeSettings) _then) =
      _$ThemeSettingsCopyWithImpl;
  @useResult
  $Res call({ThemeBrightness brightness, int color, double contrastLevel});
}

/// @nodoc
class _$ThemeSettingsCopyWithImpl<$Res>
    implements $ThemeSettingsCopyWith<$Res> {
  _$ThemeSettingsCopyWithImpl(this._self, this._then);

  final ThemeSettings _self;
  final $Res Function(ThemeSettings) _then;

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = null,
    Object? color = null,
    Object? contrastLevel = null,
  }) {
    return _then(_self.copyWith(
      brightness: null == brightness
          ? _self.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as ThemeBrightness,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      contrastLevel: null == contrastLevel
          ? _self.contrastLevel
          : contrastLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ThemeSettings extends ThemeSettings {
  const _ThemeSettings(
      {required this.brightness,
      required this.color,
      required this.contrastLevel})
      : assert(contrastLevel >= -1 || contrastLevel <= 1,
            'contrastLevel value must be in range [-1:1]'),
        super._();
  factory _ThemeSettings.fromJson(Map<String, dynamic> json) =>
      _$ThemeSettingsFromJson(json);

  @override
  final ThemeBrightness brightness;
  @override
  final int color;
  @override
  final double contrastLevel;

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ThemeSettingsCopyWith<_ThemeSettings> get copyWith =>
      __$ThemeSettingsCopyWithImpl<_ThemeSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ThemeSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeSettings &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.contrastLevel, contrastLevel) ||
                other.contrastLevel == contrastLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, brightness, color, contrastLevel);

  @override
  String toString() {
    return 'ThemeSettings(brightness: $brightness, color: $color, contrastLevel: $contrastLevel)';
  }
}

/// @nodoc
abstract mixin class _$ThemeSettingsCopyWith<$Res>
    implements $ThemeSettingsCopyWith<$Res> {
  factory _$ThemeSettingsCopyWith(
          _ThemeSettings value, $Res Function(_ThemeSettings) _then) =
      __$ThemeSettingsCopyWithImpl;
  @override
  @useResult
  $Res call({ThemeBrightness brightness, int color, double contrastLevel});
}

/// @nodoc
class __$ThemeSettingsCopyWithImpl<$Res>
    implements _$ThemeSettingsCopyWith<$Res> {
  __$ThemeSettingsCopyWithImpl(this._self, this._then);

  final _ThemeSettings _self;
  final $Res Function(_ThemeSettings) _then;

  /// Create a copy of ThemeSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brightness = null,
    Object? color = null,
    Object? contrastLevel = null,
  }) {
    return _then(_ThemeSettings(
      brightness: null == brightness
          ? _self.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as ThemeBrightness,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      contrastLevel: null == contrastLevel
          ? _self.contrastLevel
          : contrastLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
