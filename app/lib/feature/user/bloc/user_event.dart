part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {}

final class UserInitializationRequested extends UserEvent {
  UserInitializationRequested();

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
