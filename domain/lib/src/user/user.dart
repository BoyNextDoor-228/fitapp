import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../nutrition/meal/meal.dart';
import '../nutrition/product/product.dart';
import '../training/training/training.dart';
import '../utils/uuid_value_converter.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User._({
    @UuidValueConverter() required UuidValue id,
    required double weight,
    required List<Training> trainings,
    required List<Meal> meals,
    required List<Product> products,
  }) = _User;

  /// Creates a [User] with specified [weight] and empty lists of [trainings],
  /// [meals] and [products].
  factory User.create({required double weight}) => User._(
        id: UuidValue.fromString(const Uuid().v1()),
        weight: weight,
        trainings: [],
        meals: [],
        products: [],
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
