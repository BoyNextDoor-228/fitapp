// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {
  @UuidValueConverter()
  UuidValue get id;
  String get name;
  MeasurementUnit get measurementUnit;
  NutritionFacts get nutritionFacts;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductCopyWith<Product> get copyWith =>
      _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.measurementUnit, measurementUnit) ||
                other.measurementUnit == measurementUnit) &&
            (identical(other.nutritionFacts, nutritionFacts) ||
                other.nutritionFacts == nutritionFacts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, measurementUnit, nutritionFacts);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, measurementUnit: $measurementUnit, nutritionFacts: $nutritionFacts)';
  }
}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) =
      _$ProductCopyWithImpl;
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String name,
      MeasurementUnit measurementUnit,
      NutritionFacts nutritionFacts});

  $NutritionFactsCopyWith<$Res> get nutritionFacts;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? measurementUnit = null,
    Object? nutritionFacts = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      measurementUnit: null == measurementUnit
          ? _self.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      nutritionFacts: null == nutritionFacts
          ? _self.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as NutritionFacts,
    ));
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionFactsCopyWith<$Res> get nutritionFacts {
    return $NutritionFactsCopyWith<$Res>(_self.nutritionFacts, (value) {
      return _then(_self.copyWith(nutritionFacts: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Product implements Product {
  const _Product(
      {@UuidValueConverter() required this.id,
      required this.name,
      required this.measurementUnit,
      required this.nutritionFacts});
  factory _Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  @UuidValueConverter()
  final UuidValue id;
  @override
  final String name;
  @override
  final MeasurementUnit measurementUnit;
  @override
  final NutritionFacts nutritionFacts;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.measurementUnit, measurementUnit) ||
                other.measurementUnit == measurementUnit) &&
            (identical(other.nutritionFacts, nutritionFacts) ||
                other.nutritionFacts == nutritionFacts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, measurementUnit, nutritionFacts);

  @override
  String toString() {
    return 'Product._(id: $id, name: $name, measurementUnit: $measurementUnit, nutritionFacts: $nutritionFacts)';
  }
}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) =
      __$ProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String name,
      MeasurementUnit measurementUnit,
      NutritionFacts nutritionFacts});

  @override
  $NutritionFactsCopyWith<$Res> get nutritionFacts;
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? measurementUnit = null,
    Object? nutritionFacts = null,
  }) {
    return _then(_Product(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      measurementUnit: null == measurementUnit
          ? _self.measurementUnit
          : measurementUnit // ignore: cast_nullable_to_non_nullable
              as MeasurementUnit,
      nutritionFacts: null == nutritionFacts
          ? _self.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as NutritionFacts,
    ));
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionFactsCopyWith<$Res> get nutritionFacts {
    return $NutritionFactsCopyWith<$Res>(_self.nutritionFacts, (value) {
      return _then(_self.copyWith(nutritionFacts: value));
    });
  }
}

// dart format on
