// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repetition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Repetition {
  int get repsAmount;

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepetitionCopyWith<Repetition> get copyWith =>
      _$RepetitionCopyWithImpl<Repetition>(this as Repetition, _$identity);

  /// Serializes this Repetition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Repetition &&
            (identical(other.repsAmount, repsAmount) ||
                other.repsAmount == repsAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, repsAmount);

  @override
  String toString() {
    return 'Repetition(repsAmount: $repsAmount)';
  }
}

/// @nodoc
abstract mixin class $RepetitionCopyWith<$Res> {
  factory $RepetitionCopyWith(
          Repetition value, $Res Function(Repetition) _then) =
      _$RepetitionCopyWithImpl;
  @useResult
  $Res call({int repsAmount});
}

/// @nodoc
class _$RepetitionCopyWithImpl<$Res> implements $RepetitionCopyWith<$Res> {
  _$RepetitionCopyWithImpl(this._self, this._then);

  final Repetition _self;
  final $Res Function(Repetition) _then;

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repsAmount = null,
  }) {
    return _then(_self.copyWith(
      repsAmount: null == repsAmount
          ? _self.repsAmount
          : repsAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Repetition extends Repetition {
  const _Repetition({required this.repsAmount}) : super._();
  factory _Repetition.fromJson(Map<String, dynamic> json) =>
      _$RepetitionFromJson(json);

  @override
  final int repsAmount;

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepetitionCopyWith<_Repetition> get copyWith =>
      __$RepetitionCopyWithImpl<_Repetition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepetitionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Repetition &&
            (identical(other.repsAmount, repsAmount) ||
                other.repsAmount == repsAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, repsAmount);

  @override
  String toString() {
    return 'Repetition(repsAmount: $repsAmount)';
  }
}

/// @nodoc
abstract mixin class _$RepetitionCopyWith<$Res>
    implements $RepetitionCopyWith<$Res> {
  factory _$RepetitionCopyWith(
          _Repetition value, $Res Function(_Repetition) _then) =
      __$RepetitionCopyWithImpl;
  @override
  @useResult
  $Res call({int repsAmount});
}

/// @nodoc
class __$RepetitionCopyWithImpl<$Res> implements _$RepetitionCopyWith<$Res> {
  __$RepetitionCopyWithImpl(this._self, this._then);

  final _Repetition _self;
  final $Res Function(_Repetition) _then;

  /// Create a copy of Repetition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? repsAmount = null,
  }) {
    return _then(_Repetition(
      repsAmount: null == repsAmount
          ? _self.repsAmount
          : repsAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
