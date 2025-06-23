import 'dart:developer';

import 'package:fitapp_domain/domain.dart';
import 'package:uuid/uuid_value.dart';

import '../exception/bad_value_passed_exception.dart';
import '../exception/null_user_exception.dart';

/// Service for managing actions on a user.
class UserService {
  UserService({required IUserRepository userRepository}) {
    _userRepository = userRepository;
    _createUser = userRepository.createUser;
    _updateUser = userRepository.updateUser;
    _saveUser = userRepository.saveUser;
  }

  /// A repository, which implements methods and properties for managing actions
  /// on a user.
  late final IUserRepository _userRepository;

  /// Callback which CREATES a user in [_userRepository].
  late final void Function({required double userWeight}) _createUser;

  /// Callback which UPDATES a user in [_userRepository].
  late final void Function({required User updatedUser}) _updateUser;

  /// Callback which SAVES a user in a storage.
  late final Function() _saveUser;

  /// Private getter of a user, described in [_userRepository].
  User? get _user => _userRepository.user;

  /// Getter which returns user, described in [_userRepository], for
  /// outer consumers.
  User? get user => _userRepository.user;

  /// Creates a new user and saves it in a storage.
  Future<void> createUser({required double userWeight}) async {
    try {
      _createUser(
        userWeight: userWeight,
      );

      await _saveUser();
    } on Exception catch (exception) {
      log('Could not create user.');
      log('Exception message: $exception');
    }
  }

  /// Updates current user's weight with passed [newWeight] and
  /// saves updated user in a storage.
  Future<void> updateUserWeight({required double newWeight}) async {
    try {
      if (_user == null) {
        throw NullUserException();
      }

      if (newWeight <= 0.0) {
        throw ArgumentError('newWeight must be greater than 0.0', 'newWeight');
      }

      _updateUser(updatedUser: _user!.copyWith(weight: newWeight));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not update user weight.');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Adds a new training, passed in [newTraining], to user's trainings
  /// list and saves updates in a storage.
  Future<void> addTraining({required Training newTraining}) async {
    try {
      final userTrainings = _getUserTrainings();

      final hasDuplicateId = userTrainings.any(
        (training) => training.id == newTraining.id,
      );

      if (hasDuplicateId) {
        throw BadValuePassedException(
          description:
              'Identifier of newTraining is already presented in trainings list',
        );
      }

      userTrainings.add(newTraining);

      _updateUser(updatedUser: _user!.copyWith(trainings: userTrainings));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not add new training.');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Deletes a training by id, passed in [trainingId], from user's trainings
  /// list and saves updates in a storage.
  Future<void> deleteTraining({required UuidValue trainingId}) async {
    try {
      final editedUserTrainings = _getUserTrainings()
        ..removeWhere(
          (training) => training.id == trainingId,
        );

      _updateUser(updatedUser: _user!.copyWith(trainings: editedUserTrainings));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not delete training.');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits a training in user's trainings list and saves updates in a storage.
  ///
  /// Notice: [editedTraining]'s id must match source training's id
  /// you want to edit.
  Future<void> editTraining({required Training editedTraining}) async {
    try {
      final userTrainings = _getUserTrainings()
          .map(
            (training) =>
                training.id == editedTraining.id ? editedTraining : training,
          )
          .toList();

      _updateUser(updatedUser: _user!.copyWith(trainings: userTrainings));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not edit training');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Adds an exercise in a training in user's trainings list and
  /// saves updates in a storage.
  ///
  /// Pass [trainingId] to determine the training you want to add
  /// a [newExercise] to.
  Future<void> addExerciseInTraining({
    required UuidValue trainingId,
    required Exercise newExercise,
  }) async {
    try {
      final trainingToEdit = _getUserTrainingById(trainingId: trainingId);

      final hasDuplicateId = trainingToEdit.exercises.any(
        (exercise) => exercise.id == newExercise.id,
      );

      if (hasDuplicateId) {
        throw BadValuePassedException(
          description: '''
Identifier of newExercise is already presented in training exercises list''',
        );
      }

      final editedExercisesList = List<Exercise>.from(trainingToEdit.exercises)
        ..add(newExercise);

      final editedTraining =
          trainingToEdit.copyWith(exercises: editedExercisesList);

      await editTraining(editedTraining: editedTraining);
    } on Exception catch (exception) {
      log('Could not add exercise in training');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Deletes an exercise by [exerciseId] from user's training by [trainingId]
  /// and saves updates in a storage.
  Future<void> deleteExerciseInTraining({
    required UuidValue trainingId,
    required UuidValue exerciseId,
  }) async {
    try {
      final trainingToEdit = _getUserTrainingById(trainingId: trainingId);

      final editedExercisesList = List<Exercise>.from(trainingToEdit.exercises)
        ..removeWhere(
          (exercise) => exercise.id == exerciseId,
        );

      final editedTraining =
          trainingToEdit.copyWith(exercises: editedExercisesList);

      await editTraining(editedTraining: editedTraining);
    } on Exception catch (exception) {
      log('Could not delete exercise from training');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits an exercise in a training by [trainingId] and saves updates
  /// in a storage.
  ///
  /// Notice: [editedExercise]'s id must match source exercise's id
  /// you want to edit.
  Future<void> editExerciseInTraining({
    required UuidValue trainingId,
    required Exercise editedExercise,
  }) async {
    try {
      final trainingToEdit = _getUserTrainingById(trainingId: trainingId);

      final editedExercisesList = trainingToEdit.exercises
          .map(
            (exercise) =>
                exercise.id == editedExercise.id ? editedExercise : exercise,
          )
          .toList();

      final editedTraining =
          trainingToEdit.copyWith(exercises: editedExercisesList);

      await editTraining(editedTraining: editedTraining);
    } on Exception catch (exception) {
      log('Could not edit exercise in training');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Completes training by [trainingId], which means, all exercises in this
  /// training get their statistics updated.
  Future<void> completeTraining({
    required UuidValue trainingId,
    required DateTime completedAt,
  }) async {
    try {
      final trainingToEdit = _getUserTrainingById(trainingId: trainingId);

      final updatedTrainingExercises = trainingToEdit.exercises
          .map(
            (exercise) => exercise.copyWith(
              statistics: [
                ...exercise.statistics,
                ExerciseStatistic(load: exercise.load, date: completedAt),
              ],
            ),
          )
          .toList();

      final editedTraining =
          trainingToEdit.copyWith(exercises: updatedTrainingExercises);

      await editTraining(editedTraining: editedTraining);
    } on Exception catch (exception) {
      log('Could not complete training');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Adds a [newMeal] to user's meals list and saves updates in a storage.
  Future<void> addMeal({required Meal newMeal}) async {
    try {
      final userMeals = _getUserMeals();

      final hasDuplicateId = userMeals.any(
        (meal) => meal.id == newMeal.id,
      );

      if (hasDuplicateId) {
        throw BadValuePassedException(
          description:
              'Identifier of newMeal is already presented in user meals list',
        );
      }

      userMeals.add(newMeal);
      _updateUser(updatedUser: _user!.copyWith(meals: userMeals));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not add meal');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Deletes a meal by [mealId] from user's meals list and saves updates
  /// in a storage.
  Future<void> deleteMeal({required UuidValue mealId}) async {
    try {
      final editedUserMeals = _getUserMeals()
        ..removeWhere(
          (meal) => meal.id == mealId,
        );

      _updateUser(updatedUser: _user!.copyWith(meals: editedUserMeals));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not delete meal');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits a meal in user's meal list and saves updates in a storage.
  ///
  /// Notice: [editedMeal]'s id must match source meal's id you want to edit.
  Future<void> editMeal({required Meal editedMeal}) async {
    try {
      final editedUserMeals = _getUserMeals()
          .map(
            (meal) => meal.id == editedMeal.id ? editedMeal : meal,
          )
          .toList();

      _updateUser(updatedUser: _user!.copyWith(meals: editedUserMeals));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not edit meal');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Adds an ingredient in a meal in user's meals list and saves updates
  /// in a storage.
  ///
  /// Pass [mealId] to determine the meal you want to add a [newIngredient] to.
  Future<void> addIngredientInMeal({
    required UuidValue mealId,
    required Ingredient newIngredient,
  }) async {
    try {
      final mealToEdit = _getUserMealById(mealId: mealId);

      final hasDuplicateProduct = mealToEdit.ingredients.any(
        (ingredient) => ingredient.product == newIngredient.product,
      );

      if (hasDuplicateProduct) {
        throw BadValuePassedException(
          description: '''
Ingredient with '${newIngredient.product.name}' is already presented in ingredients list''',
        );
      }

      final editedIngredientsList =
          List<Ingredient>.from(mealToEdit.ingredients)..add(newIngredient);

      final editedMeal =
          mealToEdit.copyWith(ingredients: editedIngredientsList);

      await editMeal(editedMeal: editedMeal);
    } on Exception catch (exception) {
      log('Could not add ingredient in meal');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Deletes an ingredient passed in [ingredientToDelete] from user's
  /// meal, determined by [mealId], and saves updates in a storage.
  Future<void> deleteIngredientInMeal({
    required UuidValue mealId,
    required Ingredient ingredientToDelete,
  }) async {
    try {
      final mealToEdit = _getUserMealById(mealId: mealId);

      final editedIngredientsList =
          List<Ingredient>.from(mealToEdit.ingredients)
            ..removeWhere(
              (ingredient) => ingredient == ingredientToDelete,
            );

      final editedMeal =
          mealToEdit.copyWith(ingredients: editedIngredientsList);

      await editMeal(editedMeal: editedMeal);
    } on Exception catch (exception) {
      log('Could not delete ingredient in meal');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits an ingredient in a meal by [mealId] and saves updates in a storage.
  Future<void> editIngredientInMeal({
    required UuidValue mealId,
    required Ingredient editedIngredient,
  }) async {
    try {
      final mealToEdit = _getUserMealById(mealId: mealId);

      // In this case, editedIngredient's identifier is a product,
      // which belongs to an ingredient.
      final editedIngredientsList = mealToEdit.ingredients
          .map(
            (ingredient) => ingredient.product == editedIngredient.product
                ? editedIngredient
                : ingredient,
          )
          .toList();

      final editedMeal =
          mealToEdit.copyWith(ingredients: editedIngredientsList);

      await editMeal(editedMeal: editedMeal);
    } on Exception catch (exception) {
      log('Could not edit ingredient in meal');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Returns a [Product] created based on passed [name], [measurementUnit]
  /// and [nutritionFacts].
  Product createProduct({
    required String name,
    required NutritionFacts nutritionFacts,
    required MeasurementUnit measurementUnit,
  }) =>
      Product.create(
        name: name,
        measurementUnit: measurementUnit,
        nutritionFacts: nutritionFacts,
      );

  /// Adds a new product, passed in [newProduct], to user's products list
  /// and saves updates in a storage.
  Future<void> addProduct({required Product newProduct}) async {
    try {
      final userProducts = _getUserProducts();

      final hasDuplicateId = userProducts.any(
        (product) => product.id == newProduct.id,
      );

      if (hasDuplicateId) {
        throw BadValuePassedException(
          description:
              'Identifier of newProduct is already presented in products list',
        );
      }

      userProducts.add(newProduct);
      _updateUser(updatedUser: user!.copyWith(products: userProducts));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not add product');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Deletes a product by id, passed in [productId], from user's products list
  /// and saves updates in a storage.
  Future<void> deleteProduct({required UuidValue productId}) async {
    try {
      final updatedProducts = _getUserProducts()
        ..removeWhere(
          (product) => product.id == productId,
        );

      _updateUser(updatedUser: user!.copyWith(products: updatedProducts));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not delete product');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Edits a product in user's products list and saves updates in a storage.
  ///
  /// Notice: [editedProduct]'s id must match source product's id you want
  /// to edit.
  Future<void> editProduct({required Product editedProduct}) async {
    try {
      final updatedProducts = _getUserProducts()
          .map(
            (product) =>
                product.id == editedProduct.id ? editedProduct : product,
          )
          .toList();

      _updateUser(updatedUser: user!.copyWith(products: updatedProducts));
      await _saveUser();
    } on Exception catch (exception) {
      log('Could not edit product');
      log('Exception message: $exception');
      rethrow;
    }
  }

  /// Returns current list of user trainings.
  List<Training> _getUserTrainings() {
    if (_user == null) {
      throw NullUserException();
    }

    return List.from(_user!.trainings);
  }

  /// Returns a training from user trainings list by [trainingId].
  Training _getUserTrainingById({required UuidValue trainingId}) =>
      _getUserTrainings()
          .where(
            (training) => training.id == trainingId,
          )
          .single;

  /// Returns list of current user meals.
  List<Meal> _getUserMeals() {
    if (_user == null) {
      throw NullUserException();
    }

    return List.from(_user!.meals);
  }

  /// Returns a meal from user meals list by [mealId].
  Meal _getUserMealById({required UuidValue mealId}) => _getUserMeals()
      .where(
        (meal) => meal.id == mealId,
      )
      .single;

  /// Returns list of current user products.
  List<Product> _getUserProducts() {
    if (_user == null) {
      throw NullUserException();
    }

    return List.from(_user!.products);
  }
}
