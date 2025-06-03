// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Training _$TrainingFromJson(Map<String, dynamic> json) {
  return _Training.fromJson(json);
}

/// @nodoc
mixin _$Training {
  @UuidValueConverter()
  UuidValue get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Exercise> get exercises => throw _privateConstructorUsedError;

  /// Serializes this Training to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Training
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrainingCopyWith<Training> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingCopyWith<$Res> {
  factory $TrainingCopyWith(Training value, $Res Function(Training) then) =
      _$TrainingCopyWithImpl<$Res, Training>;
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      List<Exercise> exercises});
}

/// @nodoc
class _$TrainingCopyWithImpl<$Res, $Val extends Training>
    implements $TrainingCopyWith<$Res> {
  _$TrainingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainingImplCopyWith<$Res>
    implements $TrainingCopyWith<$Res> {
  factory _$$TrainingImplCopyWith(
          _$TrainingImpl value, $Res Function(_$TrainingImpl) then) =
      __$$TrainingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      List<Exercise> exercises});
}

/// @nodoc
class __$$TrainingImplCopyWithImpl<$Res>
    extends _$TrainingCopyWithImpl<$Res, _$TrainingImpl>
    implements _$$TrainingImplCopyWith<$Res> {
  __$$TrainingImplCopyWithImpl(
      _$TrainingImpl _value, $Res Function(_$TrainingImpl) _then)
      : super(_value, _then);

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
    return _then(_$TrainingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<Exercise>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingImpl implements _Training {
  const _$TrainingImpl(
      {@UuidValueConverter() required this.id,
      required this.title,
      required this.description,
      required final List<Exercise> exercises})
      : _exercises = exercises;

  factory _$TrainingImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrainingImplFromJson(json);

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

  @override
  String toString() {
    return 'Training._(id: $id, title: $title, description: $description, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrainingImpl &&
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

  /// Create a copy of Training
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingImplCopyWith<_$TrainingImpl> get copyWith =>
      __$$TrainingImplCopyWithImpl<_$TrainingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingImplToJson(
      this,
    );
  }
}

abstract class _Training implements Training {
  const factory _Training(
      {@UuidValueConverter() required final UuidValue id,
      required final String title,
      required final String? description,
      required final List<Exercise> exercises}) = _$TrainingImpl;

  factory _Training.fromJson(Map<String, dynamic> json) =
      _$TrainingImpl.fromJson;

  @override
  @UuidValueConverter()
  UuidValue get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  List<Exercise> get exercises;

  /// Create a copy of Training
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrainingImplCopyWith<_$TrainingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
