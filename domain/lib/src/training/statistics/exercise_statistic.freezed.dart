// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseStatistic {
  @ExerciseLoadConverter()
  ExerciseLoad get load;
  DateTime get date;

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseStatisticCopyWith<ExerciseStatistic> get copyWith =>
      _$ExerciseStatisticCopyWithImpl<ExerciseStatistic>(
          this as ExerciseStatistic, _$identity);

  /// Serializes this ExerciseStatistic to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExerciseStatistic &&
            (identical(other.load, load) || other.load == load) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, load, date);

  @override
  String toString() {
    return 'ExerciseStatistic(load: $load, date: $date)';
  }
}

/// @nodoc
abstract mixin class $ExerciseStatisticCopyWith<$Res> {
  factory $ExerciseStatisticCopyWith(
          ExerciseStatistic value, $Res Function(ExerciseStatistic) _then) =
      _$ExerciseStatisticCopyWithImpl;
  @useResult
  $Res call({@ExerciseLoadConverter() ExerciseLoad load, DateTime date});
}

/// @nodoc
class _$ExerciseStatisticCopyWithImpl<$Res>
    implements $ExerciseStatisticCopyWith<$Res> {
  _$ExerciseStatisticCopyWithImpl(this._self, this._then);

  final ExerciseStatistic _self;
  final $Res Function(ExerciseStatistic) _then;

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? load = null,
    Object? date = null,
  }) {
    return _then(_self.copyWith(
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as ExerciseLoad,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ExerciseStatistic extends ExerciseStatistic {
  const _ExerciseStatistic(
      {@ExerciseLoadConverter() required this.load, required this.date})
      : super._();
  factory _ExerciseStatistic.fromJson(Map<String, dynamic> json) =>
      _$ExerciseStatisticFromJson(json);

  @override
  @ExerciseLoadConverter()
  final ExerciseLoad load;
  @override
  final DateTime date;

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExerciseStatisticCopyWith<_ExerciseStatistic> get copyWith =>
      __$ExerciseStatisticCopyWithImpl<_ExerciseStatistic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExerciseStatisticToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExerciseStatistic &&
            (identical(other.load, load) || other.load == load) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, load, date);

  @override
  String toString() {
    return 'ExerciseStatistic(load: $load, date: $date)';
  }
}

/// @nodoc
abstract mixin class _$ExerciseStatisticCopyWith<$Res>
    implements $ExerciseStatisticCopyWith<$Res> {
  factory _$ExerciseStatisticCopyWith(
          _ExerciseStatistic value, $Res Function(_ExerciseStatistic) _then) =
      __$ExerciseStatisticCopyWithImpl;
  @override
  @useResult
  $Res call({@ExerciseLoadConverter() ExerciseLoad load, DateTime date});
}

/// @nodoc
class __$ExerciseStatisticCopyWithImpl<$Res>
    implements _$ExerciseStatisticCopyWith<$Res> {
  __$ExerciseStatisticCopyWithImpl(this._self, this._then);

  final _ExerciseStatistic _self;
  final $Res Function(_ExerciseStatistic) _then;

  /// Create a copy of ExerciseStatistic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? load = null,
    Object? date = null,
  }) {
    return _then(_ExerciseStatistic(
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as ExerciseLoad,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
