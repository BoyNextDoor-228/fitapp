// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Timer _$TimerFromJson(Map<String, dynamic> json) {
  return _Timer.fromJson(json);
}

/// @nodoc
mixin _$Timer {
  Duration get duration => throw _privateConstructorUsedError;

  /// Serializes this Timer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerCopyWith<Timer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerCopyWith<$Res> {
  factory $TimerCopyWith(Timer value, $Res Function(Timer) then) =
      _$TimerCopyWithImpl<$Res, Timer>;
  @useResult
  $Res call({Duration duration});
}

/// @nodoc
class _$TimerCopyWithImpl<$Res, $Val extends Timer>
    implements $TimerCopyWith<$Res> {
  _$TimerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerImplCopyWith<$Res> implements $TimerCopyWith<$Res> {
  factory _$$TimerImplCopyWith(
          _$TimerImpl value, $Res Function(_$TimerImpl) then) =
      __$$TimerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration duration});
}

/// @nodoc
class __$$TimerImplCopyWithImpl<$Res>
    extends _$TimerCopyWithImpl<$Res, _$TimerImpl>
    implements _$$TimerImplCopyWith<$Res> {
  __$$TimerImplCopyWithImpl(
      _$TimerImpl _value, $Res Function(_$TimerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(_$TimerImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerImpl extends _Timer {
  const _$TimerImpl({required this.duration}) : super._();

  factory _$TimerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerImplFromJson(json);

  @override
  final Duration duration;

  @override
  String toString() {
    return 'Timer(duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, duration);

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerImplCopyWith<_$TimerImpl> get copyWith =>
      __$$TimerImplCopyWithImpl<_$TimerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerImplToJson(
      this,
    );
  }
}

abstract class _Timer extends Timer {
  const factory _Timer({required final Duration duration}) = _$TimerImpl;
  const _Timer._() : super._();

  factory _Timer.fromJson(Map<String, dynamic> json) = _$TimerImpl.fromJson;

  @override
  Duration get duration;

  /// Create a copy of Timer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerImplCopyWith<_$TimerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
