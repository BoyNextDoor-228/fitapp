import '../feature/user/bloc/user_bloc.dart';
import '../generated/l10n.dart';

String userErrorToLocalizedText(S text, UserError errorCase) {
  switch (errorCase) {
    case UserError.cantInitUser:
      return text.couldNotLoadUserData;
    case UserError.cantCreateUser:
      return text.couldNotCreateUser;
    case UserError.cantUpdateUserWeight:
      return text.couldNotUpdateUserWeight;
    case UserError.cantCreateTraining:
      return text.couldNotCreateANewTraining;
    case UserError.cantDeleteTraining:
      return text.couldNotDeleteTraining;
    case UserError.cantEditTraining:
      return text.couldNotEditTraining;
    case UserError.cantAddExerciseInTraining:
      return text.couldNotAddExerciseInTraining;
    case UserError.cantEditExerciseInTraining:
      return text.couldNotEditExerciseInTraining;
    case UserError.cantDeleteExerciseFromTraining:
      return text.couldNotDeleteExerciseFromTraining;
    case UserError.cantCompleteTraining:
      return text.couldNotCompleteTraining;
    case UserError.cantCreateMeal:
      return text.couldNotCreateANewMeal;
    case UserError.cantDeleteMeal:
      return text.couldNotDeleteMeal;
    case UserError.cantEditMeal:
      return text.couldNotEditMeal;
    case UserError.cantAddIngredientInMeal:
      return text.couldNotAddIngredientInMeal;
    case UserError.cantEditIngredientInMeal:
      return text.couldNotEditIngredientInMeal;
    case UserError.cantDeleteIngredientFromMeal:
      return text.couldNotDeleteIngredientFromMeal;
    case UserError.cantCreateProduct:
      return text.couldNotCreateANewProduct;
    case UserError.cantEditProduct:
      return text.couldNotEditProduct;
    case UserError.cantDeleteProduct:
      return text.couldNotDeleteProduct;
  }
}

String userSuccessToLocalizedText(S text, UserSuccess successCase) {
  switch (successCase) {
    case UserSuccess.mealAdded:
      return text.mealAdded;
    case UserSuccess.mealEdited:
      return text.mealEdited;
    case UserSuccess.mealDeleted:
      return text.mealDeleted;
    case UserSuccess.productAdded:
      return text.productAdded;
    case UserSuccess.productEdited:
      return text.productEdited;
    case UserSuccess.productDeleted:
      return text.productDeleted;
    case UserSuccess.trainingAdded:
      return text.trainingAdded;
    case UserSuccess.trainingEdited:
      return text.trainingEdited;
    case UserSuccess.trainingDeleted:
      return text.trainingDeleted;
    case UserSuccess.trainingFinished:
      return text.trainingFinished;
    case UserSuccess.weightUpdated:
      return text.weightUpdated;
  }
}
