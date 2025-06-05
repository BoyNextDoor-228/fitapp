// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Timer {
  Duration get duration;

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerCopyWith<Timer> get copyWith =>
      _$TimerCopyWithImpl<Timer>(this as Timer, _$identity);

  /// Serializes this Timer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Timer &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @override
  String toString() {
    return 'Timer(duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $TimerCopyWith<$Res> {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) _then) =
      _$TimerCopyWithImpl;
  @useResult
  $Res call({Duration duration});
}

/// @nodoc
class _$TimerCopyWithImpl<$Res> implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._self, this._then);

  final Timer _self;
  final $Res Function(Timer) _then;

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(_self.copyWith(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Timer extends Timer {
  const _Timer({required this.duration}) : super._();
  factory _Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  @override
  final Duration duration;

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimerCopyWith<_Timer> get copyWith =>
      __$TimerCopyWithImpl<_Timer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TimerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Timer &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @override
  String toString() {
    return 'Timer(duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$TimerCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$TimerCopyWith(_Timer value, $Res Function(_Timer) _then) =
      __$TimerCopyWithImpl;
  @override
  @useResult
  $Res call({Duration duration});
}

/// @nodoc
class __$TimerCopyWithImpl<$Res> implements _$TimerCopyWith<$Res> {
  __$TimerCopyWithImpl(this._self, this._then);

  final _Timer _self;
  final $Res Function(_Timer) _then;

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? duration = null,
  }) {
    return _then(_Timer(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

// dart format on
