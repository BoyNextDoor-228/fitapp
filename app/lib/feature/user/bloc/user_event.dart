part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {}

final class UserInitializationRequested extends UserEvent {
  UserInitializationRequested();

  @override
  List<Object?> get props => [];
}

final class UserLoadingRequested extends UserEvent {
  UserLoadingRequested({required this.user});

  final User? user;

  @override
  List<Object?> get props => [];
}

final class UserCreated extends UserEvent {
  UserCreated({required this.userWeight});
  final double userWeight;

  @override
  List<Object?> get props => [userWeight];
}

final class UserWeightUpdated extends UserEvent {
  UserWeightUpdated({required this.newWeight});
  final double newWeight;

  @override
  List<Object?> get props => [newWeight];
}

final class TrainingAdded extends UserEvent {
  TrainingAdded({required this.newTraining});
  final Training newTraining;

  @override
  List<Object?> get props => [newTraining];
}

final class TrainingDeleted extends UserEvent {
  TrainingDeleted({required this.trainingId});
  final UuidValue trainingId;

  @override
  List<Object?> get props => [trainingId];
}

final class TrainingEdited extends UserEvent {
  TrainingEdited({required this.editedTraining});
  final Training editedTraining;

  @override
  List<Object?> get props => [editedTraining];
}

final class InTrainingExerciseAdded extends UserEvent {
  InTrainingExerciseAdded({
    required this.trainingId,
    required this.newExercise,
  });
  final UuidValue trainingId;
  final Exercise newExercise;

  @override
  List<Object?> get props => [trainingId, newExercise];
}

final class InTrainingExerciseDeleted extends UserEvent {
  InTrainingExerciseDeleted({
    required this.trainingId,
    required this.exerciseId,
  });
  final UuidValue trainingId;
  final UuidValue exerciseId;

  @override
  List<Object?> get props => [trainingId, exerciseId];
}

final class InTrainingExerciseEdited extends UserEvent {
  InTrainingExerciseEdited({
    required this.trainingId,
    required this.editedExercise,
  });
  final UuidValue trainingId;
  final Exercise editedExercise;

  @override
  List<Object?> get props => [trainingId, editedExercise];
}

final class TrainingCompleted extends UserEvent {
  TrainingCompleted({required this.trainingId});
  final UuidValue trainingId;

  @override
  List<Object?> get props => [trainingId];
}

final class MealAdded extends UserEvent {
  MealAdded({required this.newMeal});
  final Meal newMeal;

  @override
  List<Object?> get props => [newMeal];
}

final class MealDeleted extends UserEvent {
  MealDeleted({required this.mealId});
  final UuidValue mealId;

  @override
  List<Object?> get props => [mealId];
}

final class MealEdited extends UserEvent {
  MealEdited({required this.editedMeal});
  final Meal editedMeal;

  @override
  List<Object?> get props => [editedMeal];
}

final class InMealIngredientAdded extends UserEvent {
  InMealIngredientAdded({
    required this.mealId,
    required this.newIngredient,
  });
  final UuidValue mealId;
  final Ingredient newIngredient;

  @override
  List<Object?> get props => [mealId, newIngredient];
}

final class InMealIngredientDeleted extends UserEvent {
  InMealIngredientDeleted({
    required this.mealId,
    required this.ingredientToDelete,
  });
  final UuidValue mealId;
  final Ingredient ingredientToDelete;

  @override
  List<Object?> get props => [mealId, ingredientToDelete];
}

final class InMealIngredientEdited extends UserEvent {
  InMealIngredientEdited({
    required this.mealId,
    required this.editedIngredient,
  });
  final UuidValue mealId;
  final Ingredient editedIngredient;

  @override
  List<Object?> get props => [mealId, editedIngredient];
}

final class ProductAdded extends UserEvent {
  ProductAdded({required this.newProduct});
  final Product newProduct;

  @override
  List<Object?> get props => [newProduct];
}

final class ProductDeleted extends UserEvent {
  ProductDeleted({required this.productId});
  final UuidValue productId;

  @override
  List<Object?> get props => [productId];
}

final class ProductEdited extends UserEvent {
  ProductEdited({required this.editedProduct});
  final Product editedProduct;

  @override
  List<Object?> get props => [editedProduct];
}
