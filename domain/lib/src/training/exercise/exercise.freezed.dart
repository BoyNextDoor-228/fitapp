// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Exercise {
  @UuidValueConverter()
  UuidValue get id;
  String get title;
  String? get description;
  int get sets;
  @ExerciseLoadConverter()
  ExerciseLoad get load;
  List<ExerciseStatistic> get statistics;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExerciseCopyWith<Exercise> get copyWith =>
      _$ExerciseCopyWithImpl<Exercise>(this as Exercise, _$identity);

  /// Serializes this Exercise to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Exercise &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.load, load) || other.load == load) &&
            const DeepCollectionEquality()
                .equals(other.statistics, statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, sets,
      load, const DeepCollectionEquality().hash(statistics));

  @override
  String toString() {
    return 'Exercise(id: $id, title: $title, description: $description, sets: $sets, load: $load, statistics: $statistics)';
  }
}

/// @nodoc
abstract mixin class $ExerciseCopyWith<$Res> {
  factory $ExerciseCopyWith(Exercise value, $Res Function(Exercise) _then) =
      _$ExerciseCopyWithImpl;
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      int sets,
      @ExerciseLoadConverter() ExerciseLoad load,
      List<ExerciseStatistic> statistics});
}

/// @nodoc
class _$ExerciseCopyWithImpl<$Res> implements $ExerciseCopyWith<$Res> {
  _$ExerciseCopyWithImpl(this._self, this._then);

  final Exercise _self;
  final $Res Function(Exercise) _then;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? sets = null,
    Object? load = null,
    Object? statistics = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sets: null == sets
          ? _self.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as ExerciseLoad,
      statistics: null == statistics
          ? _self.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<ExerciseStatistic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Exercise implements Exercise {
  const _Exercise(
      {@UuidValueConverter() required this.id,
      required this.title,
      required this.description,
      required this.sets,
      @ExerciseLoadConverter() required this.load,
      required final List<ExerciseStatistic> statistics})
      : _statistics = statistics;
  factory _Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  @override
  @UuidValueConverter()
  final UuidValue id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int sets;
  @override
  @ExerciseLoadConverter()
  final ExerciseLoad load;
  final List<ExerciseStatistic> _statistics;
  @override
  List<ExerciseStatistic> get statistics {
    if (_statistics is EqualUnmodifiableListView) return _statistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statistics);
  }

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExerciseCopyWith<_Exercise> get copyWith =>
      __$ExerciseCopyWithImpl<_Exercise>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExerciseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Exercise &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.load, load) || other.load == load) &&
            const DeepCollectionEquality()
                .equals(other._statistics, _statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, sets,
      load, const DeepCollectionEquality().hash(_statistics));

  @override
  String toString() {
    return 'Exercise._(id: $id, title: $title, description: $description, sets: $sets, load: $load, statistics: $statistics)';
  }
}

/// @nodoc
abstract mixin class _$ExerciseCopyWith<$Res>
    implements $ExerciseCopyWith<$Res> {
  factory _$ExerciseCopyWith(_Exercise value, $Res Function(_Exercise) _then) =
      __$ExerciseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      int sets,
      @ExerciseLoadConverter() ExerciseLoad load,
      List<ExerciseStatistic> statistics});
}

/// @nodoc
class __$ExerciseCopyWithImpl<$Res> implements _$ExerciseCopyWith<$Res> {
  __$ExerciseCopyWithImpl(this._self, this._then);

  final _Exercise _self;
  final $Res Function(_Exercise) _then;

  /// Create a copy of Exercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? sets = null,
    Object? load = null,
    Object? statistics = null,
  }) {
    return _then(_Exercise(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sets: null == sets
          ? _self.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as int,
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as ExerciseLoad,
      statistics: null == statistics
          ? _self._statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<ExerciseStatistic>,
    ));
  }
}

// dart format on
