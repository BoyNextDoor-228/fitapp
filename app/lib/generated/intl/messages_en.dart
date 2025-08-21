// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(thisObject) =>
      "Are you sure you want to delete ${thisObject}?";

  static String m1(measurement) => "100 ${measurement} contain:";

  static String m2(ingredientAmount) => "${ingredientAmount} gr.";

  static String m3(ingredientAmount) => "${ingredientAmount} ml.";

  static String m4(sets, duration) => "${sets} set(s) of ${duration}";

  static String m5(sets, N) => "${sets} set(s) of ${N} rep(s)";

  static String m6(exerciseTitle) => "Statistics of ${exerciseTitle}";

  static String m7(N) => "Total ingredients: ${N}";

  static String m8(userWeight) => "Your current weight: ${userWeight}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addExercise": MessageLookupByLibrary.simpleMessage("Add exercise"),
        "addIngredient": MessageLookupByLibrary.simpleMessage("Add ingredient"),
        "addSomeExercisesToStartThisTraining":
            MessageLookupByLibrary.simpleMessage(
          "Add some exercises to start this training",
        ),
        "anErrorOccurred": MessageLookupByLibrary.simpleMessage(
          "An error occurred",
        ),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "areYouSureYouWantToDelete": m0,
        "back": MessageLookupByLibrary.simpleMessage("back"),
        "carbohydrates": MessageLookupByLibrary.simpleMessage("Carbohydrates"),
        "carbohydratesAmount": MessageLookupByLibrary.simpleMessage(
          "Carbohydrates amount",
        ),
        "changeWeight": MessageLookupByLibrary.simpleMessage("Change weight"),
        "checkStatistics":
            MessageLookupByLibrary.simpleMessage("Check statistics"),
        "couldNotAddExerciseInTraining": MessageLookupByLibrary.simpleMessage(
          "Could not add exercise in training.",
        ),
        "couldNotAddIngredientInMeal": MessageLookupByLibrary.simpleMessage(
          "Could not add ingredient in meal.",
        ),
        "couldNotCompleteTraining": MessageLookupByLibrary.simpleMessage(
          "Could not update training data.",
        ),
        "couldNotCreateANewMeal": MessageLookupByLibrary.simpleMessage(
          "Could not create a new meal",
        ),
        "couldNotCreateANewProduct": MessageLookupByLibrary.simpleMessage(
          "Could not create a new product.",
        ),
        "couldNotCreateANewTraining": MessageLookupByLibrary.simpleMessage(
          "Could not create a new training.",
        ),
        "couldNotCreateUser": MessageLookupByLibrary.simpleMessage(
          "Could not create user.",
        ),
        "couldNotDeleteExerciseFromTraining":
            MessageLookupByLibrary.simpleMessage(
          "Could not delete exercise from training.",
        ),
        "couldNotDeleteIngredientFromMeal":
            MessageLookupByLibrary.simpleMessage(
          "Could not delete ingredient from meal.",
        ),
        "couldNotDeleteMeal": MessageLookupByLibrary.simpleMessage(
          "Could not delete meal.",
        ),
        "couldNotDeleteProduct": MessageLookupByLibrary.simpleMessage(
          "Could not delete product.",
        ),
        "couldNotDeleteTraining": MessageLookupByLibrary.simpleMessage(
          "Could not delete training.",
        ),
        "couldNotEditExerciseInTraining": MessageLookupByLibrary.simpleMessage(
          "Could not edit exercise in training.",
        ),
        "couldNotEditIngredientInMeal": MessageLookupByLibrary.simpleMessage(
          "Could not edit ingredient in meal.",
        ),
        "couldNotEditMeal": MessageLookupByLibrary.simpleMessage(
          "Could not edit meal.",
        ),
        "couldNotEditProduct": MessageLookupByLibrary.simpleMessage(
          "Could not edit product",
        ),
        "couldNotEditTraining": MessageLookupByLibrary.simpleMessage(
          "Could not edit training.",
        ),
        "couldNotLoadUserData": MessageLookupByLibrary.simpleMessage(
          "Could not load user data.",
        ),
        "couldNotUpdateUserWeight": MessageLookupByLibrary.simpleMessage(
          "Could not update user weight.",
        ),
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "createANewExercise": MessageLookupByLibrary.simpleMessage(
          "Create a new exercise",
        ),
        "createANewIngredient": MessageLookupByLibrary.simpleMessage(
          "Create a new ingredient",
        ),
        "createMeal": MessageLookupByLibrary.simpleMessage("Create meal"),
        "createProduct": MessageLookupByLibrary.simpleMessage("Create product"),
        "createTraining":
            MessageLookupByLibrary.simpleMessage("Create training"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deletion": MessageLookupByLibrary.simpleMessage("Deletion"),
        "dragLeftSideRightToOpenMenu": MessageLookupByLibrary.simpleMessage(
          "Drag left side right to open menu.",
        ),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editMeal": MessageLookupByLibrary.simpleMessage("Edit Meal"),
        "editProduct": MessageLookupByLibrary.simpleMessage("Edit Product"),
        "editTraining": MessageLookupByLibrary.simpleMessage("Edit Training"),
        "editWeight": MessageLookupByLibrary.simpleMessage("Edit weight"),
        "enterAmount": MessageLookupByLibrary.simpleMessage("Enter amount"),
        "enterIngredientAmount": MessageLookupByLibrary.simpleMessage(
          "Enter ingredient amount",
        ),
        "enterIntegerNumber": MessageLookupByLibrary.simpleMessage(
          "Enter integer number",
        ),
        "enterRepsCount":
            MessageLookupByLibrary.simpleMessage("Enter reps count"),
        "enterSetsCount":
            MessageLookupByLibrary.simpleMessage("Enter sets count"),
        "enterTitle": MessageLookupByLibrary.simpleMessage("Enter title"),
        "enterValidIntegerNumber": MessageLookupByLibrary.simpleMessage(
          "Enter valid integer number",
        ),
        "enterValidNumber": MessageLookupByLibrary.simpleMessage(
          "Enter valid number",
        ),
        "enterYourWeight": MessageLookupByLibrary.simpleMessage(
          "Enter your weight",
        ),
        "exercise": MessageLookupByLibrary.simpleMessage("exercise"),
        "exerciseAdded": MessageLookupByLibrary.simpleMessage("Exercise added"),
        "exerciseEditing":
            MessageLookupByLibrary.simpleMessage("Exercise editing"),
        "exerciseInformation": MessageLookupByLibrary.simpleMessage(
          "Exercise information",
        ),
        "exercisesAreAbsent": MessageLookupByLibrary.simpleMessage(
          "Exercises are absent",
        ),
        "exercisesStatistics": MessageLookupByLibrary.simpleMessage(
          "Exercises statistics",
        ),
        "exit": MessageLookupByLibrary.simpleMessage("Exit"),
        "fats": MessageLookupByLibrary.simpleMessage("Fats"),
        "fatsAmount": MessageLookupByLibrary.simpleMessage("Fats amount"),
        "fillTheFormToCreateANewMeal": MessageLookupByLibrary.simpleMessage(
          "Fill the form to create a new meal",
        ),
        "fillTheFormToCreateANewProduct": MessageLookupByLibrary.simpleMessage(
          "Fill the form to create a new product",
        ),
        "fillTheFormToCreateANewTraining": MessageLookupByLibrary.simpleMessage(
          "Fill the form to create a new training",
        ),
        "fillTheFormToEditMeal": MessageLookupByLibrary.simpleMessage(
          "Fill the form to edit meal",
        ),
        "fillTheFormToEditTheProduct": MessageLookupByLibrary.simpleMessage(
          "Fill the form to edit the product",
        ),
        "fillTheFormToEditTraining": MessageLookupByLibrary.simpleMessage(
          "Fill the form to edit training",
        ),
        "finish": MessageLookupByLibrary.simpleMessage("Finish"),
        "finishTraining":
            MessageLookupByLibrary.simpleMessage("Finish training"),
        "goToProducts": MessageLookupByLibrary.simpleMessage("Go to products"),
        "goodWorknYourTrainingProgressHasBeenUpdated":
            MessageLookupByLibrary.simpleMessage(
          "Good work!\nYour training progress has been updated!",
        ),
        "grams": MessageLookupByLibrary.simpleMessage("Grams"),
        "gramsShort": MessageLookupByLibrary.simpleMessage("gr."),
        "hereYouCanChangeYourCurrentWeight":
            MessageLookupByLibrary.simpleMessage(
          "Here you can change your current weight",
        ),
        "high": MessageLookupByLibrary.simpleMessage("High"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "hundredMeasurementContain": m1,
        "ingredient": MessageLookupByLibrary.simpleMessage("ingredient"),
        "ingredientEditing": MessageLookupByLibrary.simpleMessage(
          "Ingredient editing",
        ),
        "ingredientamountGr": m2,
        "ingredientamountMl": m3,
        "interfaceContrastLevel": MessageLookupByLibrary.simpleMessage(
          "Interface contrast level",
        ),
        "interfaceLanguage": MessageLookupByLibrary.simpleMessage(
          "Interface language",
        ),
        "interfaceMainColor": MessageLookupByLibrary.simpleMessage(
          "Interface main color",
        ),
        "kilocalories": MessageLookupByLibrary.simpleMessage("Kilocalories"),
        "kilocaloriesAmount": MessageLookupByLibrary.simpleMessage(
          "Kilocalories amount",
        ),
        "low": MessageLookupByLibrary.simpleMessage("Low"),
        "makeSureFractionalNumberIsCorrect":
            MessageLookupByLibrary.simpleMessage(
          "Make sure fractional number is correct",
        ),
        "markAsCompleted": MessageLookupByLibrary.simpleMessage(
          "Mark as completed",
        ),
        "meal": MessageLookupByLibrary.simpleMessage("meal"),
        "mealAdded": MessageLookupByLibrary.simpleMessage("Meal added!"),
        "mealDeleted": MessageLookupByLibrary.simpleMessage("Meal deleted."),
        "mealEdited": MessageLookupByLibrary.simpleMessage("Meal edited!"),
        "mealInformation":
            MessageLookupByLibrary.simpleMessage("Meal information"),
        "meals": MessageLookupByLibrary.simpleMessage("Meals"),
        "mealsList": MessageLookupByLibrary.simpleMessage("Meals list"),
        "measurementUnit": MessageLookupByLibrary.simpleMessage(
          "Measurement unit:",
        ),
        "medium": MessageLookupByLibrary.simpleMessage("Medium"),
        "milliliters": MessageLookupByLibrary.simpleMessage("Milliliters"),
        "millilitersShort": MessageLookupByLibrary.simpleMessage("ml."),
        "newExerciseDescriptionOptional": MessageLookupByLibrary.simpleMessage(
          "New exercise description (optional)",
        ),
        "newExerciseTitle": MessageLookupByLibrary.simpleMessage(
          "New exercise title",
        ),
        "newMeal": MessageLookupByLibrary.simpleMessage("New Meal"),
        "newMealRecipeOptional": MessageLookupByLibrary.simpleMessage(
          "New meal recipe (optional)",
        ),
        "newMealTitle": MessageLookupByLibrary.simpleMessage("New meal title"),
        "newProduct": MessageLookupByLibrary.simpleMessage("New product"),
        "newProductName":
            MessageLookupByLibrary.simpleMessage("New product name"),
        "newTraining": MessageLookupByLibrary.simpleMessage("New Training"),
        "newTrainingDescriptionOptional": MessageLookupByLibrary.simpleMessage(
          "New training description (optional)",
        ),
        "newTrainingTitle": MessageLookupByLibrary.simpleMessage(
          "New training title",
        ),
        "next": MessageLookupByLibrary.simpleMessage("next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noDescription": MessageLookupByLibrary.simpleMessage("No description"),
        "noExercisesYet":
            MessageLookupByLibrary.simpleMessage("No exercises yet."),
        "noExercisesYetPress": MessageLookupByLibrary.simpleMessage(
          "No exercises yet.\nPress \'Add exercise\' button to create one.",
        ),
        "noIngredientsYet": MessageLookupByLibrary.simpleMessage(
          "No ingredients yet.\nPress \'Add ingredient\' button to create one.",
        ),
        "noMeals": MessageLookupByLibrary.simpleMessage("No meals"),
        "noMealsYetnPressPlusButtonToCreateANew":
            MessageLookupByLibrary.simpleMessage(
          "No meals yet.\n Tap \'Plus\' button to create a new meal",
        ),
        "noProducts": MessageLookupByLibrary.simpleMessage("No products"),
        "noProductsYetnPressPlusButtonToCreateANew":
            MessageLookupByLibrary.simpleMessage(
          "No products yet.\n Tap \'Plus\' button to create a new product",
        ),
        "noProductsncreateAProductFirstToAddItAsAn":
            MessageLookupByLibrary.simpleMessage(
          "No products!\nCreate a product first to add it as an ingredient.",
        ),
        "noRecipe": MessageLookupByLibrary.simpleMessage("No recipe"),
        "noStatisticsForThisExerciseYetntoMakeStatisticsOfThis":
            MessageLookupByLibrary.simpleMessage(
          "No Statistics for this exercise yet.\nTo get it\'s statistics, complete a training this exercise is a part of.",
        ),
        "noTrainings": MessageLookupByLibrary.simpleMessage("No trainings"),
        "noTrainingsYetNTapPlusIconToCreateA":
            MessageLookupByLibrary.simpleMessage(
          "No trainings yet. \n Tap \'Plus\' icon to create a new training",
        ),
        "numberMustBeNonnegative": MessageLookupByLibrary.simpleMessage(
          "Number must be non-negative",
        ),
        "product": MessageLookupByLibrary.simpleMessage("product"),
        "productAdded": MessageLookupByLibrary.simpleMessage("Product added!"),
        "productDeleted":
            MessageLookupByLibrary.simpleMessage("Product deleted."),
        "productEdited":
            MessageLookupByLibrary.simpleMessage("Product edited!"),
        "products": MessageLookupByLibrary.simpleMessage("Products"),
        "productsList": MessageLookupByLibrary.simpleMessage("Products list"),
        "proteins": MessageLookupByLibrary.simpleMessage("Proteins"),
        "proteinsAmount":
            MessageLookupByLibrary.simpleMessage("Proteins amount"),
        "reps": MessageLookupByLibrary.simpleMessage("Reps"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
        "selectColor": MessageLookupByLibrary.simpleMessage("Select color"),
        "selectLanguage":
            MessageLookupByLibrary.simpleMessage("Select language"),
        "selectProduct": MessageLookupByLibrary.simpleMessage("Select product"),
        "setsSetsOfDuration": m4,
        "setsSetsOfNReps": m5,
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "startTraining": MessageLookupByLibrary.simpleMessage("Start training"),
        "statisticsOfExercisetitle": m6,
        "tapToOpenTimer":
            MessageLookupByLibrary.simpleMessage("Tap to open timer"),
        "thisExercise": MessageLookupByLibrary.simpleMessage("this exercise"),
        "thisIngredient":
            MessageLookupByLibrary.simpleMessage("this ingredient"),
        "thisMeal": MessageLookupByLibrary.simpleMessage("this meal"),
        "thisProduct": MessageLookupByLibrary.simpleMessage("this product"),
        "thisTraining": MessageLookupByLibrary.simpleMessage("this training"),
        "timer": MessageLookupByLibrary.simpleMessage("Timer"),
        "totalIngredientsN": m7,
        "training": MessageLookupByLibrary.simpleMessage("Training"),
        "trainingAdded":
            MessageLookupByLibrary.simpleMessage("Training added!"),
        "trainingDeleted": MessageLookupByLibrary.simpleMessage(
          "Training deleted.",
        ),
        "trainingEdited":
            MessageLookupByLibrary.simpleMessage("Training edited!"),
        "trainingFinished": MessageLookupByLibrary.simpleMessage(
          "Training finished.",
        ),
        "trainingInformation": MessageLookupByLibrary.simpleMessage(
          "Training information",
        ),
        "trainings": MessageLookupByLibrary.simpleMessage("Trainings"),
        "trainingsList": MessageLookupByLibrary.simpleMessage("Trainings list"),
        "watchStatistics":
            MessageLookupByLibrary.simpleMessage("Watch Statistics"),
        "weightUpdated":
            MessageLookupByLibrary.simpleMessage("Weight updated!"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yourCurrentWeightIs": MessageLookupByLibrary.simpleMessage(
          "Your current weight is:",
        ),
        "yourCurrentWeightN": m8,
      };
}
