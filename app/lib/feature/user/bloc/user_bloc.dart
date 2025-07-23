import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitapp_domain/domain.dart';
import 'package:uuid/uuid.dart';

import '../../../service/user_service.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  /// [Bloc], which handles actions of User.
  ///
  /// This [Bloc] allows:
  /// - create user,
  /// - update user weight,
  ///
  /// - create new training in user trainings list,
  /// - edit training in user trainings list,
  /// - delete training from user trainings list,
  /// - update user training statistics,
  ///
  /// - create new meal in user meals list,
  /// - edit meal in user meals list,
  /// - delete meal from user meals list,
  ///
  /// - create new product in user products list,
  /// - edit product in user products list,
  /// - delete product from user products list,
  UserBloc({required UserService userService})
      : _userService = userService,
        super(UserState.initial()) {
    on<UserInitializationRequested>(_onUserInitializationRequested);

    on<UserCreated>(_onUserCreated);
    on<UserWeightUpdated>(_onUserWeightUpdated);

    on<TrainingAdded>(_onTrainingAdded);
    on<TrainingDeleted>(_onTrainingDeleted);
    on<TrainingEdited>(_onTrainingEdited);
    on<TrainingCompleted>(_onTrainingCompleted);

    on<MealAdded>(_onMealAdded);
    on<MealDeleted>(_onMealDeleted);
    on<MealEdited>(_onMealEdited);

    on<ProductAdded>(_onProductAdded);
    on<ProductDeleted>(_onProductDeleted);
    on<ProductEdited>(_onProductEdited);
  }

  final UserService _userService;

  void _onUserInitializationRequested(
    UserInitializationRequested _,
    Emitter<UserState> emit,
  ) {
    try {
      emit(UserState.loading(user: null));
      final user = _userService.user;
      emit(UserState.calm(user: user));
    } on Exception {
      _handleUserException(emit, UserError.cantInitUser);
    }
  }

  Future<void> _onUserCreated(
    UserCreated event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: null));
      await _userService.createUser(userWeight: event.userWeight);
      final user = _userService.user;
      if (user == null) {
        emit(
          UserState.error(
            user: null,
            errorMessage: UserError.cantCreateUser,
          ),
        );
      }
      emit(UserState.calm(user: user));
    } on Exception {
      _handleUserException(emit, UserError.cantCreateUser);
    }
  }

  Future<void> _onUserWeightUpdated(
    UserWeightUpdated event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.updateUserWeight(newWeight: event.newWeight);
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.weightUpdated,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantUpdateUserWeight);
    }
  }

  Future<void> _onTrainingAdded(
    TrainingAdded event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.addTraining(newTraining: event.newTraining);
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.trainingAdded,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantCreateTraining);
    }
  }

  Future<void> _onTrainingDeleted(
    TrainingDeleted event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.deleteTraining(trainingId: event.trainingId);
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.trainingDeleted,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantDeleteTraining);
    }
  }

  Future<void> _onTrainingEdited(
    TrainingEdited event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.editTraining(editedTraining: event.editedTraining);
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.trainingEdited,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantEditTraining);
    }
  }

  Future<void> _onTrainingCompleted(
    TrainingCompleted event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.completeTraining(
        trainingId: event.trainingId,
        completedAt: DateTime.now(),
      );
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.trainingFinished,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantCompleteTraining);
    }
  }

  Future<void> _onMealAdded(
    MealAdded event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.addMeal(newMeal: event.newMeal);
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.mealAdded,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantCreateMeal);
    }
  }

  Future<void> _onMealDeleted(
    MealDeleted event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.deleteMeal(mealId: event.mealId);
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.mealDeleted,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantDeleteMeal);
    }
  }

  Future<void> _onMealEdited(
    MealEdited event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.editMeal(editedMeal: event.editedMeal);
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.mealEdited,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantEditMeal);
    }
  }

  Future<void> _onProductAdded(
    ProductAdded event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.addProduct(
        newProduct: event.newProduct,
      );
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.productAdded,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantCreateProduct);
    }
  }

  Future<void> _onProductEdited(
    ProductEdited event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.editProduct(
        editedProduct: event.editedProduct,
      );
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.productEdited,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantEditProduct);
    }
  }

  Future<void> _onProductDeleted(
    ProductDeleted event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserState.loading(user: _userService.user));
      await _userService.deleteProduct(
        productId: event.productId,
      );
      emit(
        UserState.success(
          user: _userService.user,
          successMessage: UserSuccess.productDeleted,
        ),
      );
      emit(UserState.calm(user: _userService.user));
    } on Exception {
      _handleUserException(emit, UserError.cantDeleteProduct);
    }
  }

  void _handleUserException(Emitter<UserState> emit, UserError errorMessage) {
    emit(
      UserState.error(
        user: _userService.user,
        errorMessage: errorMessage,
      ),
    );
    emit(UserState.calm(user: _userService.user));
  }
}
