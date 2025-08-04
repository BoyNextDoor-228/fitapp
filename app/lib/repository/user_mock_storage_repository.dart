import 'dart:developer';

import 'package:fitapp_domain/domain.dart';
import 'package:uuid/uuid_value.dart';

class UserMockStorageRepository implements IStorageRepository<User> {
  /// Implements mock Storage Repository for storing user information.
  UserMockStorageRepository();

  /// Reads and returns [User] from a storage.
  ///
  /// Returns [Null], if no user presented in storage.
  @override
  Future<User?> read() async => _readUserFromMock();

  @override
  Future<void> save(User loadToSave) async =>
      throw Exception('Unable save in mock storage');

  @override
  Future<void> clearStorage() => throw Exception('Unable clear mock storage');

  /// Reads mock and returns [User].
  /// If failed to read, returns [Null].
  Future<User?> _readUserFromMock() async {
    try {
      return createMockUser();
    } on Exception catch (exception) {
      log('Could not read user from Hive.');
      log('Exception message: $exception');
      return null;
    }
  }
}

User createMockUser() {
  const productsAmount = 10;

  const lowMultiplier = 1.0;
  const midMultiplier = 10.0;
  const highMultiplier = 50.0;

  final mockProducts = List<Product>.generate(
    productsAmount,
    (int index) => Product.create(
      name: 'Product №$index',
      measurementUnit:
          index.isEven ? MeasurementUnit.milliliters : MeasurementUnit.grams,
      nutritionFacts: NutritionFacts(
        proteins: lowMultiplier * index,
        fats: lowMultiplier * index,
        carbohydrates: midMultiplier * index,
        kilocalories: highMultiplier * index,
      ),
    ).copyWith(
      id: UuidValue.fromString('c91b3518-ede2-11ef-8300-a3504b8d50ff'),
    ),
  );

  final mockIngredients = List.generate(
    2,
    (int index) => Ingredient(
      product: mockProducts[index],
      amount: 200,
    ),
  );

  final mockMeals = List.generate(
    3,
    (int index) => Meal.create(
      title: 'Meal №$index',
      recipe: index.isEven ? null : 'Meal №$index superduper description',
    ).copyWith(
      ingredients: mockIngredients,
      id: UuidValue.fromString('aaab3518-ede2-11ef-8300-a3504b8d5111'),
    ),
  );

  final mockExerciseStatistics = [
    ExerciseStatistic(
      load: const Repetition(repsAmount: 10),
      date: DateTime(2025, 1, 1, 1, 1, 1, 1, 1),
    ),
    ExerciseStatistic(
      load: const Repetition(repsAmount: 12),
      date: DateTime(2025, 2, 1, 1, 1, 1, 1, 1),
    ),
  ];

  final mockExercises = List.generate(
    2,
    (int index) => Exercise(
      title: 'Exercise 1 title',
      description: null,
      sets: 2,
      load: const Repetition(repsAmount: 10),
      statistics: mockExerciseStatistics,
    ).copyWith(
      id: UuidValue.fromString('33b3518-ede2-11ef-8300-a3504b8d5aa$index'),
    ),
  );

  final mockTrainings = List.generate(
    3,
    (int index) => Training.create(
      title: 'Training №$index',
      description:
          index.isEven ? null : 'Training №$index superduper description',
    ).copyWith(
      id: UuidValue.fromString('222b3518-ede2-11ef-8300-a3504b8d5eee'),
      exercises: mockExercises,
    ),
  );

  return User.create(weight: 100).copyWith(
    id: UuidValue.fromString('111b3518-ede2-11ef-8300-a3504b8d5000'),
    meals: mockMeals,
    trainings: mockTrainings,
  );
}
