// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Training {
  @UuidValueConverter()
  UuidValue get id;
  String get title;
  String? get description;
  List<Exercise> get exercises;

  /// Create a copy of Training
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrainingCopyWith<Training> get copyWith =>
      _$TrainingCopyWithImpl<Training>(this as Training, _$identity);

  /// Serializes this Training to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Training &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.exercises, exercises));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(exercises));

  @override
  String toString() {
    return 'Training(id: $id, title: $title, description: $description, exercises: $exercises)';
  }
}

/// @nodoc
abstract mixin class $TrainingCopyWith<$Res> {
  factory $TrainingCopyWith(Training value, $Res Function(Training) _then) =
      _$TrainingCopyWithImpl;
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      List<Exercise> exercises});
}

/// @nodoc
class _$TrainingCopyWithImpl<$Res> implements $TrainingCopyWith<$Res> {
  _$TrainingCopyWithImpl(this._self, this._then);

  final Training _self;
  final $Res Function(Training) _then;

  /// Create a copy of Training
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? exercises = null,
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
      exercises: null == exercises
          ? _self.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Training implements Training {
  const _Training(
      {@UuidValueConverter() required this.id,
      required this.title,
      required this.description,
      required final List<Exercise> exercises})
      : _exercises = exercises;
  factory _Training.fromJson(Map<String, dynamic> json) =>
      _$TrainingFromJson(json);

  @override
  @UuidValueConverter()
  final UuidValue id;
  @override
  final String title;
  @override
  final String? description;
  final List<Exercise> _exercises;
  @override
  List<Exercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  /// Create a copy of Training
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TrainingCopyWith<_Training> get copyWith =>
      __$TrainingCopyWithImpl<_Training>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TrainingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Training &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(_exercises));

  @override
  String toString() {
    return 'Training._(id: $id, title: $title, description: $description, exercises: $exercises)';
  }
}

/// @nodoc
abstract mixin class _$TrainingCopyWith<$Res>
    implements $TrainingCopyWith<$Res> {
  factory _$TrainingCopyWith(_Training value, $Res Function(_Training) _then) =
      __$TrainingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      List<Exercise> exercises});
}

/// @nodoc
class __$TrainingCopyWithImpl<$Res> implements _$TrainingCopyWith<$Res> {
  __$TrainingCopyWithImpl(this._self, this._then);

  final _Training _self;
  final $Res Function(_Training) _then;

  /// Create a copy of Training
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? exercises = null,
  }) {
    return _then(_Training(
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
      exercises: null == exercises
          ? _self._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

// dart format on
