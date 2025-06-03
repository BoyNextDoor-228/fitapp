// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repetition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Repetition _$RepetitionFromJson(Map<String, dynamic> json) {
  return _Repetition.fromJson(json);
}

/// @nodoc
mixin _$Repetition {
  int get repsAmount => throw _privateConstructorUsedError;

  /// Serializes this Repetition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepetitionCopyWith<Repetition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepetitionCopyWith<$Res> {
  factory $RepetitionCopyWith(
          Repetition value, $Res Function(Repetition) then) =
      _$RepetitionCopyWithImpl<$Res, Repetition>;
  @useResult
  $Res call({int repsAmount});
}

/// @nodoc
class _$RepetitionCopyWithImpl<$Res, $Val extends Repetition>
    implements $RepetitionCopyWith<$Res> {
  _$RepetitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repsAmount = null,
  }) {
    return _then(_value.copyWith(
      repsAmount: null == repsAmount
          ? _value.repsAmount
          : repsAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepetitionImplCopyWith<$Res>
    implements $RepetitionCopyWith<$Res> {
  factory _$$RepetitionImplCopyWith(
          _$RepetitionImpl value, $Res Function(_$RepetitionImpl) then) =
      __$$RepetitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int repsAmount});
}

/// @nodoc
class __$$RepetitionImplCopyWithImpl<$Res>
    extends _$RepetitionCopyWithImpl<$Res, _$RepetitionImpl>
    implements _$$RepetitionImplCopyWith<$Res> {
  __$$RepetitionImplCopyWithImpl(
      _$RepetitionImpl _value, $Res Function(_$RepetitionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repsAmount = null,
  }) {
    return _then(_$RepetitionImpl(
      repsAmount: null == repsAmount
          ? _value.repsAmount
          : repsAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepetitionImpl extends _Repetition {
  const _$RepetitionImpl({required this.repsAmount}) : super._();

  factory _$RepetitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepetitionImplFromJson(json);

  @override
  final int repsAmount;

  @override
  String toString() {
    return 'Repetition(repsAmount: $repsAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepetitionImpl &&
            (identical(other.repsAmount, repsAmount) ||
                other.repsAmount == repsAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, repsAmount);

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepetitionImplCopyWith<_$RepetitionImpl> get copyWith =>
      __$$RepetitionImplCopyWithImpl<_$RepetitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepetitionImplToJson(
      this,
    );
  }
}

abstract class _Repetition extends Repetition {
  const factory _Repetition({required final int repsAmount}) = _$RepetitionImpl;
  const _Repetition._() : super._();

  factory _Repetition.fromJson(Map<String, dynamic> json) =
      _$RepetitionImpl.fromJson;

  @override
  int get repsAmount;

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepetitionImplCopyWith<_$RepetitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
