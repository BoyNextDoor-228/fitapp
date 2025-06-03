// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'abstract_exercise.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AbstractExercise _$AbstractExerciseFromJson(Map<String, dynamic> json) {
  return _AbstractExercise.fromJson(json);
}

/// @nodoc
mixin _$AbstractExercise {
  @UuidValueConverter()
  UuidValue get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  ExerciseLoadType get loadType => throw _privateConstructorUsedError;

  /// Serializes this AbstractExercise to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AbstractExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AbstractExerciseCopyWith<AbstractExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbstractExerciseCopyWith<$Res> {
  factory $AbstractExerciseCopyWith(
          AbstractExercise value, $Res Function(AbstractExercise) then) =
      _$AbstractExerciseCopyWithImpl<$Res, AbstractExercise>;
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      ExerciseLoadType loadType});
}

/// @nodoc
class _$AbstractExerciseCopyWithImpl<$Res, $Val extends AbstractExercise>
    implements $AbstractExerciseCopyWith<$Res> {
  _$AbstractExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AbstractExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? loadType = null,
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
      loadType: null == loadType
          ? _value.loadType
          : loadType // ignore: cast_nullable_to_non_nullable
              as ExerciseLoadType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbstractExerciseImplCopyWith<$Res>
    implements $AbstractExerciseCopyWith<$Res> {
  factory _$$AbstractExerciseImplCopyWith(_$AbstractExerciseImpl value,
          $Res Function(_$AbstractExerciseImpl) then) =
      __$$AbstractExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      String? description,
      ExerciseLoadType loadType});
}

/// @nodoc
class __$$AbstractExerciseImplCopyWithImpl<$Res>
    extends _$AbstractExerciseCopyWithImpl<$Res, _$AbstractExerciseImpl>
    implements _$$AbstractExerciseImplCopyWith<$Res> {
  __$$AbstractExerciseImplCopyWithImpl(_$AbstractExerciseImpl _value,
      $Res Function(_$AbstractExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AbstractExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? loadType = null,
  }) {
    return _then(_$AbstractExerciseImpl(
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
      loadType: null == loadType
          ? _value.loadType
          : loadType // ignore: cast_nullable_to_non_nullable
              as ExerciseLoadType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbstractExerciseImpl implements _AbstractExercise {
  const _$AbstractExerciseImpl(
      {@UuidValueConverter() required this.id,
      required this.title,
      required this.description,
      required this.loadType});

  factory _$AbstractExerciseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbstractExerciseImplFromJson(json);

  @override
  @UuidValueConverter()
  final UuidValue id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final ExerciseLoadType loadType;

  @override
  String toString() {
    return 'AbstractExercise._(id: $id, title: $title, description: $description, loadType: $loadType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbstractExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.loadType, loadType) ||
                other.loadType == loadType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, loadType);

  /// Create a copy of AbstractExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AbstractExerciseImplCopyWith<_$AbstractExerciseImpl> get copyWith =>
      __$$AbstractExerciseImplCopyWithImpl<_$AbstractExerciseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbstractExerciseImplToJson(
      this,
    );
  }
}

abstract class _AbstractExercise implements AbstractExercise {
  const factory _AbstractExercise(
      {@UuidValueConverter() required final UuidValue id,
      required final String title,
      required final String? description,
      required final ExerciseLoadType loadType}) = _$AbstractExerciseImpl;

  factory _AbstractExercise.fromJson(Map<String, dynamic> json) =
      _$AbstractExerciseImpl.fromJson;

  @override
  @UuidValueConverter()
  UuidValue get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  ExerciseLoadType get loadType;

  /// Create a copy of AbstractExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AbstractExerciseImplCopyWith<_$AbstractExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
