// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Meal {
  @UuidValueConverter()
  UuidValue get id;
  String get title;
  List<Ingredient> get ingredients;
  String? get recipe;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealCopyWith<Meal> get copyWith =>
      _$MealCopyWithImpl<Meal>(this as Meal, _$identity);

  /// Serializes this Meal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Meal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
            (identical(other.recipe, recipe) || other.recipe == recipe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(ingredients), recipe);

  @override
  String toString() {
    return 'Meal(id: $id, title: $title, ingredients: $ingredients, recipe: $recipe)';
  }
}

/// @nodoc
abstract mixin class $MealCopyWith<$Res> {
  factory $MealCopyWith(Meal value, $Res Function(Meal) _then) =
      _$MealCopyWithImpl;
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      List<Ingredient> ingredients,
      String? recipe});
}

/// @nodoc
class _$MealCopyWithImpl<$Res> implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._self, this._then);

  final Meal _self;
  final $Res Function(Meal) _then;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? ingredients = null,
    Object? recipe = freezed,
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
      ingredients: null == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      recipe: freezed == recipe
          ? _self.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Meal extends Meal {
  const _Meal(
      {@UuidValueConverter() required this.id,
      required this.title,
      required final List<Ingredient> ingredients,
      required this.recipe})
      : _ingredients = ingredients,
        super._();
  factory _Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  @override
  @UuidValueConverter()
  final UuidValue id;
  @override
  final String title;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final String? recipe;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealCopyWith<_Meal> get copyWith =>
      __$MealCopyWithImpl<_Meal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MealToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Meal &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.recipe, recipe) || other.recipe == recipe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title,
      const DeepCollectionEquality().hash(_ingredients), recipe);

  @override
  String toString() {
    return 'Meal.__(id: $id, title: $title, ingredients: $ingredients, recipe: $recipe)';
  }
}

/// @nodoc
abstract mixin class _$MealCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$MealCopyWith(_Meal value, $Res Function(_Meal) _then) =
      __$MealCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@UuidValueConverter() UuidValue id,
      String title,
      List<Ingredient> ingredients,
      String? recipe});
}

/// @nodoc
class __$MealCopyWithImpl<$Res> implements _$MealCopyWith<$Res> {
  __$MealCopyWithImpl(this._self, this._then);

  final _Meal _self;
  final $Res Function(_Meal) _then;

  /// Create a copy of Meal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? ingredients = null,
    Object? recipe = freezed,
  }) {
    return _then(_Meal(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidValue,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _self._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      recipe: freezed == recipe
          ? _self.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
