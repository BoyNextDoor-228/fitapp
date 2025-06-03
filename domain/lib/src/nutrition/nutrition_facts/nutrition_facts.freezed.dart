// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutritionFacts _$NutritionFactsFromJson(Map<String, dynamic> json) {
  return _NutritionFacts.fromJson(json);
}

/// @nodoc
mixin _$NutritionFacts {
  double get proteins => throw _privateConstructorUsedError;
  double get fats => throw _privateConstructorUsedError;
  double get carbohydrates => throw _privateConstructorUsedError;
  double get kilocalories => throw _privateConstructorUsedError;

  /// Serializes this NutritionFacts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutritionFactsCopyWith<NutritionFacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutritionFactsCopyWith<$Res> {
  factory $NutritionFactsCopyWith(
          NutritionFacts value, $Res Function(NutritionFacts) then) =
      _$NutritionFactsCopyWithImpl<$Res, NutritionFacts>;
  @useResult
  $Res call(
      {double proteins,
      double fats,
      double carbohydrates,
      double kilocalories});
}

/// @nodoc
class _$NutritionFactsCopyWithImpl<$Res, $Val extends NutritionFacts>
    implements $NutritionFactsCopyWith<$Res> {
  _$NutritionFactsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proteins = null,
    Object? fats = null,
    Object? carbohydrates = null,
    Object? kilocalories = null,
  }) {
    return _then(_value.copyWith(
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double,
      fats: null == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as double,
      kilocalories: null == kilocalories
          ? _value.kilocalories
          : kilocalories // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutritionFactsImplCopyWith<$Res>
    implements $NutritionFactsCopyWith<$Res> {
  factory _$$NutritionFactsImplCopyWith(_$NutritionFactsImpl value,
          $Res Function(_$NutritionFactsImpl) then) =
      __$$NutritionFactsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double proteins,
      double fats,
      double carbohydrates,
      double kilocalories});
}

/// @nodoc
class __$$NutritionFactsImplCopyWithImpl<$Res>
    extends _$NutritionFactsCopyWithImpl<$Res, _$NutritionFactsImpl>
    implements _$$NutritionFactsImplCopyWith<$Res> {
  __$$NutritionFactsImplCopyWithImpl(
      _$NutritionFactsImpl _value, $Res Function(_$NutritionFactsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? proteins = null,
    Object? fats = null,
    Object? carbohydrates = null,
    Object? kilocalories = null,
  }) {
    return _then(_$NutritionFactsImpl(
      proteins: null == proteins
          ? _value.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double,
      fats: null == fats
          ? _value.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double,
      carbohydrates: null == carbohydrates
          ? _value.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as double,
      kilocalories: null == kilocalories
          ? _value.kilocalories
          : kilocalories // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutritionFactsImpl extends _NutritionFacts {
  const _$NutritionFactsImpl(
      {required this.proteins,
      required this.fats,
      required this.carbohydrates,
      required this.kilocalories})
      : super._();

  factory _$NutritionFactsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutritionFactsImplFromJson(json);

  @override
  final double proteins;
  @override
  final double fats;
  @override
  final double carbohydrates;
  @override
  final double kilocalories;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutritionFactsImpl &&
            (identical(other.proteins, proteins) ||
                other.proteins == proteins) &&
            (identical(other.fats, fats) || other.fats == fats) &&
            (identical(other.carbohydrates, carbohydrates) ||
                other.carbohydrates == carbohydrates) &&
            (identical(other.kilocalories, kilocalories) ||
                other.kilocalories == kilocalories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, proteins, fats, carbohydrates, kilocalories);

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutritionFactsImplCopyWith<_$NutritionFactsImpl> get copyWith =>
      __$$NutritionFactsImplCopyWithImpl<_$NutritionFactsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutritionFactsImplToJson(
      this,
    );
  }
}

abstract class _NutritionFacts extends NutritionFacts {
  const factory _NutritionFacts(
      {required final double proteins,
      required final double fats,
      required final double carbohydrates,
      required final double kilocalories}) = _$NutritionFactsImpl;
  const _NutritionFacts._() : super._();

  factory _NutritionFacts.fromJson(Map<String, dynamic> json) =
      _$NutritionFactsImpl.fromJson;

  @override
  double get proteins;
  @override
  double get fats;
  @override
  double get carbohydrates;
  @override
  double get kilocalories;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutritionFactsImplCopyWith<_$NutritionFactsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
