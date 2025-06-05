import 'dart:io';

import 'package:app/repository/user_hive_storage_repository.dart';
import 'package:app/repository/user_repository.dart';
import 'package:app/service/user_service.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:hive/hive.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

import '../repository/mock/mock_products.dart';
import '../repository/mock/mock_user.dart';

final testUserUuidValue =
    UuidValue.fromString('191b3518-ede2-11ef-8300-a3504b8d50ff');

final testExerciseUuidValue =
    UuidValue.fromString('223b3518-ede2-11ef-8300-a3504b8d5cc1');

const testUserInitialWeight = 100.0;
const testUserEditedWeight = 90.0;

Future<void> main() async {
  final userService = await initUserService();

  group('User Service test. User very first initialization', () {
    late bool isUserAbsent;

    setUp(() {
      isUserAbsent = userService.user == null;
    });

    test('User is absent', () {
      expect(isUserAbsent, isTrue);
    });
  });

  group('User Service test. Creating a new user', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      expectedUser = User.create(
        weight: testUserInitialWeight,
      ).copyWith(id: testUserUuidValue);

      await userService.createUser(
        userWeight: testUserInitialWeight,
      );

      actualUser = userService.user?.copyWith(id: testUserUuidValue);
    });

    test('New user creation', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Updating user weight', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      await userService.createUser(
        userWeight: testUserInitialWeight,
      );

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        weight: testUserEditedWeight,
      );

      await userService.updateUserWeight(newWeight: testUserEditedWeight);

      actualUser = userService.user?.copyWith(id: testUserUuidValue);
    });

    test('Updating user weight.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Adding new user training.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      await userService.createUser(userWeight: testUserInitialWeight);

      final newTraining = mockTrainings.first;

      expectedUser = User.create(
        weight: testUserInitialWeight,
      ).copyWith(
        id: testUserUuidValue,
        trainings: [newTraining],
      );

      await userService.addTraining(newTraining: newTraining);

      actualUser = userService.user?.copyWith(id: testUserUuidValue);
    });

    test('Adding new user training.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Editing user training.', () {
    late User? actualUser;
    late User expectedUser;

    late Training editedTraining;

    setUp(() async {
      final testTraining = mockTrainings.first;

      editedTraining = testTraining.copyWith(
        title: 'Edited title of a training',
      );

      expectedUser = User.create(
        weight: testUserInitialWeight,
      ).copyWith(
        id: testUserUuidValue,
        trainings: [editedTraining],
      );

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addTraining(newTraining: testTraining);

      await userService.editTraining(
        editedTraining: editedTraining,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Editing user training.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Add exercise in user training.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testTraining = mockTrainings.first;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addTraining(newTraining: testTraining);

      final newExercise = mockExercises.first.copyWith(
        id: testExerciseUuidValue,
      );

      expectedUser = User.create(weight: 100).copyWith(
        id: testUserUuidValue,
        trainings: [
          testTraining.copyWith(
            exercises: [...testTraining.exercises, newExercise],
          ),
        ],
      );

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addTraining(newTraining: testTraining);

      await userService.addExerciseInTraining(
        trainingId: testTraining.id,
        newExercise: newExercise,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Adding new exercise in user training.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Edit exercise in user training.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testTraining = mockTrainings.first;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addTraining(newTraining: testTraining);

      final editedExercise = testTraining.exercises.last.copyWith(
        title: 'Edited title of an exercise',
      );

      final expectedExercises = List<Exercise>.from(testTraining.exercises)
        ..removeLast()
        ..add(editedExercise);

      expectedUser = User.create(
        weight: testUserInitialWeight,
      ).copyWith(
        id: testUserUuidValue,
        trainings: [
          testTraining.copyWith(
            exercises: expectedExercises,
          ),
        ],
      );

      await userService.editExerciseInTraining(
        trainingId: testTraining.id,
        editedExercise: editedExercise,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Editing exercise in user training.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Delete exercise in user training.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testTraining = mockTrainings.first;
      final exerciseToDelete = testTraining.exercises.last;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addTraining(newTraining: testTraining);

      final expectedExercises = List<Exercise>.from(testTraining.exercises)
        ..removeWhere((exercise) => exercise.id == exerciseToDelete.id);

      expectedUser = User.create(
        weight: testUserInitialWeight,
      ).copyWith(
        id: testUserUuidValue,
        trainings: [
          testTraining.copyWith(
            exercises: expectedExercises,
          ),
        ],
      );

      await userService.deleteExerciseInTraining(
        trainingId: testTraining.id,
        exerciseId: exerciseToDelete.id,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Deleting exercise in user training.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Deleting user training.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testTraining = mockTrainings.first;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addTraining(newTraining: testTraining);

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
      );

      await userService.deleteTraining(trainingId: testTraining.id);

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Deleting user training.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Completing user training.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testTraining = mockTrainings.first;

      final trainingCompletedAt = DateTime.now();

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addTraining(newTraining: testTraining);
      await userService.completeTraining(
        trainingId: testTraining.id,
        completedAt: trainingCompletedAt,
      );

      final expectedExercises = List<Exercise>.from(testTraining.exercises)
          .map(
            (exercise) => exercise.copyWith(
              statistics: [
                ...exercise.statistics,
                ExerciseStatistic(
                  load: exercise.load,
                  date: trainingCompletedAt,
                ),
              ],
            ),
          )
          .toList();

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        trainings: [testTraining.copyWith(exercises: expectedExercises)],
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Completing user training.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Adding a new meal.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testMeal = mockMeals.first;

      await userService.createUser(userWeight: testUserInitialWeight);

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        meals: [testMeal],
      );

      await userService.addMeal(newMeal: testMeal);

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Adding a new meal.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Editing user meal.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testMeal = mockMeals.first;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addMeal(newMeal: testMeal);

      final editedMeal = testMeal.copyWith(
        title: 'Edited title of a test meal',
      );

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        meals: [editedMeal],
      );

      await userService.editMeal(editedMeal: editedMeal);

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Editing user meal.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Adding ingredient in user meal.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testMeal = mockMeals.first;
      const testNutritionFacts = NutritionFacts(
        proteins: 10,
        fats: 5,
        carbohydrates: 20,
        kilocalories: 300,
      );

      final newIngredient = mockIngredients.last.copyWith(
        product: Product.create(
          name: 'New ingredient',
          measurementUnit: MeasurementUnit.grams,
          nutritionFacts: testNutritionFacts,
        ),
      );

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addMeal(newMeal: testMeal);

      final editedMeal = testMeal.copyWith(
        ingredients: [...testMeal.ingredients, newIngredient],
      );

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        meals: [editedMeal],
      );

      await userService.addIngredientInMeal(
        mealId: testMeal.id,
        newIngredient: newIngredient,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Adding new ingredient in user meal.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Editing ingredient in user meal.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testMeal = mockMeals.first;

      final editedIngredient = mockIngredients.last.copyWith(
        amount: 228,
      );

      final expectedIngredients = List<Ingredient>.from(testMeal.ingredients)
        ..removeLast()
        ..add(editedIngredient);

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addMeal(newMeal: testMeal);

      final editedMeal = testMeal.copyWith(
        ingredients: expectedIngredients,
      );

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        meals: [editedMeal],
      );

      await userService.editIngredientInMeal(
        mealId: testMeal.id,
        editedIngredient: editedIngredient,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Editing ingredient in user meal.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Deleting ingredient in user meal.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testMeal = mockMeals.first;
      final ingredientToDelete = testMeal.ingredients.last;

      final expectedIngredients = List<Ingredient>.from(testMeal.ingredients)
        ..removeLast();

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addMeal(newMeal: testMeal);

      final editedMeal = testMeal.copyWith(
        ingredients: expectedIngredients,
      );

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        meals: [editedMeal],
      );

      await userService.deleteIngredientInMeal(
        mealId: testMeal.id,
        ingredientToDelete: ingredientToDelete,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('deleting ingredient in user meal.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Deleting user meal.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testMeal = mockMeals.first;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addMeal(newMeal: testMeal);

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
      );

      await userService.deleteMeal(
        mealId: testMeal.id,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Deleting user meal.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Adding a new product.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testProduct = mockProducts.first;

      await userService.createUser(userWeight: testUserInitialWeight);

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        products: [testProduct],
      );

      await userService.addProduct(newProduct: testProduct);

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Adding a new product.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Editing user product.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testProduct = mockProducts.first;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addProduct(newProduct: testProduct);

      final editedProduct = testProduct.copyWith(
        name: 'Edited title of a test product',
      );

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
        products: [editedProduct],
      );

      await userService.editProduct(editedProduct: editedProduct);

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Editing user product.', () {
      expect(actualUser, equals(expectedUser));
    });
  });

  group('User Service test. Deleting user product.', () {
    late User? actualUser;
    late User expectedUser;

    setUp(() async {
      final testProduct = mockProducts.first;

      await userService.createUser(userWeight: testUserInitialWeight);
      await userService.addProduct(newProduct: testProduct);

      expectedUser = User.create(weight: testUserInitialWeight).copyWith(
        id: testUserUuidValue,
      );

      await userService.deleteProduct(
        productId: testProduct.id,
      );

      actualUser = userService.user?.copyWith(
        id: testUserUuidValue,
      );
    });

    test('Deleting user product.', () {
      expect(actualUser, equals(expectedUser));
    });
  });
}

Future<UserService> initUserService() async {
  final path = Directory.current.path;
  Hive.init(path);

  final storageRepository = UserHiveStorageRepository(
    userStorageBoxName: 'test_fitapp_user_box',
    userKey: 'test_fitapp_user_key',
    storagePath: path,
  );

  await storageRepository.clearStorage();

  final userRepository =
      await UserRepository.instance(storageRepository: storageRepository);

  return UserService(userRepository: userRepository);
}
