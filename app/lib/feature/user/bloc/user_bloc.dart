import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:uuid/uuid.dart';

import '../../../service/user_service.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserService userService})
      : _userService = userService,
        super(UserState.initial()) {
    on<UserInitializationRequested>(_onUserInitializationRequested);
    on<UserLoadingRequested>(_onUserLoadingRequested);
    on<UserCreated>(_onUserCreated);
    on<UserWeightUpdated>(_onUserWeightUpdated);

    on<TrainingAdded>(_onTrainingAdded);
    on<TrainingDeleted>(_onTrainingDeleted);
    on<TrainingEdited>(_onTrainingEdited);
    on<InTrainingExerciseAdded>(_onInTrainingExerciseAdded);
    on<InTrainingExerciseDeleted>(_onInTrainingExerciseDeleted);
    on<InTrainingExerciseEdited>(_onInTrainingExerciseEdited);
    on<TrainingCompleted>(_onTrainingCompleted);

    on<MealAdded>(_onMealAdded);
    on<MealDeleted>(_onMealDeleted);
    on<MealEdited>(_onMealEdited);
    on<InMealIngredientAdded>(_onInMealIngredientAdded);
    on<InMealIngredientDeleted>(_onInMealIngredientDeleted);
    on<InMealIngredientEdited>(_onInMealIngredientEdited);

    on<ProductAdded>(_onProductAdded);
    on<ProductDeleted>(_onProductDeleted);
    on<ProductEdited>(_onProductEdited);
  }

  final UserService _userService;

  void _onUserInitializationRequested(_, Emitter<UserState> emit) {
    final user = _userService.user;

    emit(UserState.success(user: user));
  }

  void _onUserLoadingRequested(
    UserLoadingRequested event,
    Emitter<UserState> emit,
  ) {
    emit(UserState.loading(user: event.user));
  }

  Future<void> _onUserCreated(
    UserCreated event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: null));
    await _userService.createUser(userWeight: event.userWeight);
    final user = _userService.user;
    if (user == null) {
      emit(UserState.error(user: null, errorMessage: 'Could not create user.'));
    } else {
      emit(UserState.success(user: user));
    }
  }

  Future<void> _onUserWeightUpdated(
    UserWeightUpdated event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.updateUserWeight(newWeight: event.newWeight);
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onTrainingAdded(
    TrainingAdded event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.addTraining(newTraining: event.newTraining);
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onTrainingDeleted(
    TrainingDeleted event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.deleteTraining(trainingId: event.trainingId);
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onTrainingEdited(
    TrainingEdited event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.editTraining(editedTraining: event.editedTraining);
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onInTrainingExerciseAdded(
    InTrainingExerciseAdded event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.addExerciseInTraining(
      trainingId: event.trainingId,
      newExercise: event.newExercise,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onInTrainingExerciseDeleted(
    InTrainingExerciseDeleted event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.deleteExerciseInTraining(
      trainingId: event.trainingId,
      exerciseId: event.exerciseId,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onInTrainingExerciseEdited(
    InTrainingExerciseEdited event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.editExerciseInTraining(
      trainingId: event.trainingId,
      editedExercise: event.editedExercise,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onTrainingCompleted(
    TrainingCompleted event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.completeTraining(
      trainingId: event.trainingId,
      completedAt: DateTime.now(),
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onMealAdded(
    MealAdded event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.addMeal(newMeal: event.newMeal);
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onMealDeleted(
    MealDeleted event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.deleteMeal(mealId: event.mealId);
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onMealEdited(
    MealEdited event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.editMeal(editedMeal: event.editedMeal);
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onInMealIngredientAdded(
    InMealIngredientAdded event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.addIngredientInMeal(
      mealId: event.mealId,
      newIngredient: event.newIngredient,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onInMealIngredientDeleted(
    InMealIngredientDeleted event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.deleteIngredientInMeal(
      mealId: event.mealId,
      ingredientToDelete: event.ingredientToDelete,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onInMealIngredientEdited(
    InMealIngredientEdited event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.editIngredientInMeal(
      mealId: event.mealId,
      editedIngredient: event.editedIngredient,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onProductAdded(
    ProductAdded event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.addProduct(
      newProduct: event.newProduct,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onProductEdited(
    ProductEdited event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.editProduct(
      editedProduct: event.editedProduct,
    );
    emit(UserState.success(user: _userService.user));
  }

  Future<void> _onProductDeleted(
    ProductDeleted event,
    Emitter<UserState> emit,
  ) async {
    emit(UserState.loading(user: _userService.user));
    await _userService.deleteProduct(
      productId: event.productId,
    );
    emit(UserState.success(user: _userService.user));
  }
}
