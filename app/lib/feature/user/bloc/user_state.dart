part of 'user_bloc.dart';

class UserState extends Equatable {
  factory UserState.initial() => const UserState._(
        status: UserStatus.initial,
        user: null,
      );

  factory UserState.calm({required User? user}) => UserState._(
        status: UserStatus.calm,
        user: user,
      );

  factory UserState.loading({
    required User? user,
  }) =>
      UserState._(
        status: UserStatus.loading,
        user: user,
      );

  factory UserState.success({
    required User? user,
    required UserSuccess successMessage,
  }) =>
      UserState._(
        status: UserStatus.success,
        user: user,
        successMessage: successMessage,
      );

  factory UserState.error({
    required User? user,
    required UserError errorMessage,
  }) =>
      UserState._(
        status: UserStatus.error,
        user: user,
        errorMessage: errorMessage,
      );

  const UserState._({
    required this.status,
    required this.user,
    this.errorMessage,
    this.successMessage,
  });

  final UserStatus status;
  final User? user;
  final UserError? errorMessage;
  final UserSuccess? successMessage;

  @override
  List<Object?> get props => [user, status, errorMessage, successMessage];
}

enum UserStatus { initial, loading, success, error, calm }

enum UserSuccess {
  mealAdded,
  mealEdited,
  mealDeleted,
  productAdded,
  productEdited,
  productDeleted,
  trainingAdded,
  trainingEdited,
  trainingDeleted,
  trainingFinished,
  weightUpdated,
}

enum UserError {
  cantInitUser,
  cantCreateUser,
  cantUpdateUserWeight,
  cantCreateTraining,
  cantDeleteTraining,
  cantEditTraining,
  cantAddExerciseInTraining,
  cantEditExerciseInTraining,
  cantDeleteExerciseFromTraining,
  cantCompleteTraining,
  cantCreateMeal,
  cantDeleteMeal,
  cantEditMeal,
  cantAddIngredientInMeal,
  cantEditIngredientInMeal,
  cantDeleteIngredientFromMeal,
  cantCreateProduct,
  cantEditProduct,
  cantDeleteProduct
}
