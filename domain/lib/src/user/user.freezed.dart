// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {
  @UuidValueConverter()
  UuidValue get id;
  double get weight;
  List<Training> get trainings;
  List<Meal> get meals;
  List<Product> get products;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other.trainings, trainings) &&
            const DeepCollectionEquality().equals(other.meals, meals) &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      weight,
      const DeepCollectionEquality().hash(trainings),
      const DeepCollectionEquality().hash(meals),
      const DeepCollectionEquality().hash(products));

  @override
  String toString() {
    return 'User(id: $id, weight: $weight, trainings: $trainings, meals: $meals, products: $products)';
  }
}

/// @nodoc
abstract mixin class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) _then) =
      _$UserCopyWithImpl;
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      double weight,
      List<Training> trainings,
      List<Meal> meals,
      List<Product> products});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? trainings = null,
    Object? meals = null,
    Object? products = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      trainings: null == trainings
          ? _self.trainings
          : trainings // ignore: cast_nullable_to_non_nullable
              as List<Training>,
      meals: null == meals
          ? _self.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _User implements User {
  const _User(
      {@UuidValueConverter() required this.id,
      required this.weight,
      required final List<Training> trainings,
      required final List<Meal> meals,
      required final List<Product> products})
      : _trainings = trainings,
        _meals = meals,
        _products = products;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  @UuidValueConverter()
  final UuidValue id;
  @override
  final double weight;
  final List<Training> _trainings;
  @override
  List<Training> get trainings {
    if (_trainings is EqualUnmodifiableListView) return _trainings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trainings);
  }

  final List<Meal> _meals;
  @override
  List<Meal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality()
                .equals(other._trainings, _trainings) &&
            const DeepCollectionEquality().equals(other._meals, _meals) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      weight,
      const DeepCollectionEquality().hash(_trainings),
      const DeepCollectionEquality().hash(_meals),
      const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'User._(id: $id, weight: $weight, trainings: $trainings, meals: $meals, products: $products)';
  }
}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) =
      __$UserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      double weight,
      List<Training> trainings,
      List<Meal> meals,
      List<Product> products});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? weight = null,
    Object? trainings = null,
    Object? meals = null,
    Object? products = null,
  }) {
    return _then(_User(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      trainings: null == trainings
          ? _self._trainings
          : trainings // ignore: cast_nullable_to_non_nullable
              as List<Training>,
      meals: null == meals
          ? _self._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

// dart format on
