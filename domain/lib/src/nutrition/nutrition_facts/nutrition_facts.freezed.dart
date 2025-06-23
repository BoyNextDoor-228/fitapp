// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFacts {
  double get proteins;
  double get fats;
  double get carbohydrates;
  double get kilocalories;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsCopyWith<NutritionFacts> get copyWith =>
      _$NutritionFactsCopyWithImpl<NutritionFacts>(
          this as NutritionFacts, _$identity);

  /// Serializes this NutritionFacts to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFacts &&
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
}

/// @nodoc
abstract mixin class $NutritionFactsCopyWith<$Res> {
  factory $NutritionFactsCopyWith(
          NutritionFacts value, $Res Function(NutritionFacts) _then) =
      _$NutritionFactsCopyWithImpl;
  @useResult
  $Res call(
      {double proteins,
      double fats,
      double carbohydrates,
      double kilocalories});
}

/// @nodoc
class _$NutritionFactsCopyWithImpl<$Res>
    implements $NutritionFactsCopyWith<$Res> {
  _$NutritionFactsCopyWithImpl(this._self, this._then);

  final NutritionFacts _self;
  final $Res Function(NutritionFacts) _then;

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
    return _then(_self.copyWith(
      proteins: null == proteins
          ? _self.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double,
      fats: null == fats
          ? _self.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double,
      carbohydrates: null == carbohydrates
          ? _self.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as double,
      kilocalories: null == kilocalories
          ? _self.kilocalories
          : kilocalories // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NutritionFacts extends NutritionFacts {
  const _NutritionFacts(
      {required this.proteins,
      required this.fats,
      required this.carbohydrates,
      required this.kilocalories})
      : super._();
  factory _NutritionFacts.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsFromJson(json);

  @override
  final double proteins;
  @override
  final double fats;
  @override
  final double carbohydrates;
  @override
  final double kilocalories;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsCopyWith<_NutritionFacts> get copyWith =>
      __$NutritionFactsCopyWithImpl<_NutritionFacts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutritionFactsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFacts &&
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
}

/// @nodoc
abstract mixin class _$NutritionFactsCopyWith<$Res>
    implements $NutritionFactsCopyWith<$Res> {
  factory _$NutritionFactsCopyWith(
          _NutritionFacts value, $Res Function(_NutritionFacts) _then) =
      __$NutritionFactsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double proteins,
      double fats,
      double carbohydrates,
      double kilocalories});
}

/// @nodoc
class __$NutritionFactsCopyWithImpl<$Res>
    implements _$NutritionFactsCopyWith<$Res> {
  __$NutritionFactsCopyWithImpl(this._self, this._then);

  final _NutritionFacts _self;
  final $Res Function(_NutritionFacts) _then;

  /// Create a copy of NutritionFacts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? proteins = null,
    Object? fats = null,
    Object? carbohydrates = null,
    Object? kilocalories = null,
  }) {
    return _then(_NutritionFacts(
      proteins: null == proteins
          ? _self.proteins
          : proteins // ignore: cast_nullable_to_non_nullable
              as double,
      fats: null == fats
          ? _self.fats
          : fats // ignore: cast_nullable_to_non_nullable
              as double,
      carbohydrates: null == carbohydrates
          ? _self.carbohydrates
          : carbohydrates // ignore: cast_nullable_to_non_nullable
              as double,
      kilocalories: null == kilocalories
          ? _self.kilocalories
          : kilocalories // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
