// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExerciseStatistic _$ExerciseStatisticFromJson(Map<String, dynamic> json) {
  return _ExerciseStatistic.fromJson(json);
}

/// @nodoc
mixin _$ExerciseStatistic {
  @ExerciseLoadConverter()
  ExerciseLoad get load => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this ExerciseStatistic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExerciseStatisticCopyWith<ExerciseStatistic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseStatisticCopyWith<$Res> {
  factory $ExerciseStatisticCopyWith(
          ExerciseStatistic value, $Res Function(ExerciseStatistic) then) =
      _$ExerciseStatisticCopyWithImpl<$Res, ExerciseStatistic>;
  @useResult
  $Res call({@ExerciseLoadConverter() ExerciseLoad load, DateTime date});
}

/// @nodoc
class _$ExerciseStatisticCopyWithImpl<$Res, $Val extends ExerciseStatistic>
    implements $ExerciseStatisticCopyWith<$Res> {
  _$ExerciseStatisticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? load = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      load: null == load
          ? _value.load
          : load // ignore: cast_nullable_to_non_nullable
              as ExerciseLoad,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseStatisticImplCopyWith<$Res>
    implements $ExerciseStatisticCopyWith<$Res> {
  factory _$$ExerciseStatisticImplCopyWith(_$ExerciseStatisticImpl value,
          $Res Function(_$ExerciseStatisticImpl) then) =
      __$$ExerciseStatisticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@ExerciseLoadConverter() ExerciseLoad load, DateTime date});
}

/// @nodoc
class __$$ExerciseStatisticImplCopyWithImpl<$Res>
    extends _$ExerciseStatisticCopyWithImpl<$Res, _$ExerciseStatisticImpl>
    implements _$$ExerciseStatisticImplCopyWith<$Res> {
  __$$ExerciseStatisticImplCopyWithImpl(_$ExerciseStatisticImpl _value,
      $Res Function(_$ExerciseStatisticImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? load = null,
    Object? date = null,
  }) {
    return _then(_$ExerciseStatisticImpl(
      load: null == load
          ? _value.load
          : load // ignore: cast_nullable_to_non_nullable
              as ExerciseLoad,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseStatisticImpl extends _ExerciseStatistic {
  const _$ExerciseStatisticImpl(
      {@ExerciseLoadConverter() required this.load, required this.date})
      : super._();

  factory _$ExerciseStatisticImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseStatisticImplFromJson(json);

  @override
  @ExerciseLoadConverter()
  final ExerciseLoad load;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ExerciseStatistic(load: $load, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseStatisticImpl &&
            (identical(other.load, load) || other.load == load) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, load, date);

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseStatisticImplCopyWith<_$ExerciseStatisticImpl> get copyWith =>
      __$$ExerciseStatisticImplCopyWithImpl<_$ExerciseStatisticImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseStatisticImplToJson(
      this,
    );
  }
}

abstract class _ExerciseStatistic extends ExerciseStatistic {
  const factory _ExerciseStatistic(
      {@ExerciseLoadConverter() required final ExerciseLoad load,
      required final DateTime date}) = _$ExerciseStatisticImpl;
  const _ExerciseStatistic._() : super._();

  factory _ExerciseStatistic.fromJson(Map<String, dynamic> json) =
      _$ExerciseStatisticImpl.fromJson;

  @override
  @ExerciseLoadConverter()
  ExerciseLoad get load;
  @override
  DateTime get date;

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExerciseStatisticImplCopyWith<_$ExerciseStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
