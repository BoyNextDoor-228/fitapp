// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Reps`
  String get reps {
    return Intl.message('Reps', name: 'reps', desc: '', args: []);
  }

  /// `Timer`
  String get timer {
    return Intl.message('Timer', name: 'timer', desc: '', args: []);
  }

  /// `Proteins`
  String get proteins {
    return Intl.message('Proteins', name: 'proteins', desc: '', args: []);
  }

  /// `Fats`
  String get fats {
    return Intl.message('Fats', name: 'fats', desc: '', args: []);
  }

  /// `Carbohydrates`
  String get carbohydrates {
    return Intl.message(
      'Carbohydrates',
      name: 'carbohydrates',
      desc: '',
      args: [],
    );
  }

  /// `Kilocalories`
  String get kilocalories {
    return Intl.message(
      'Kilocalories',
      name: 'kilocalories',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Deletion`
  String get deletion {
    return Intl.message('Deletion', name: 'deletion', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Trainings`
  String get trainings {
    return Intl.message('Trainings', name: 'trainings', desc: '', args: []);
  }

  /// `Meals`
  String get meals {
    return Intl.message('Meals', name: 'meals', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Your current weight: {userWeight}`
  String yourCurrentWeightN(Object userWeight) {
    return Intl.message(
      'Your current weight: $userWeight',
      name: 'yourCurrentWeightN',
      desc: '',
      args: [userWeight],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `New Meal`
  String get newMeal {
    return Intl.message('New Meal', name: 'newMeal', desc: '', args: []);
  }

  /// `Fill the form to create a new meal`
  String get fillTheFormToCreateANewMeal {
    return Intl.message(
      'Fill the form to create a new meal',
      name: 'fillTheFormToCreateANewMeal',
      desc: '',
      args: [],
    );
  }

  /// `Meal added!`
  String get mealAdded {
    return Intl.message('Meal added!', name: 'mealAdded', desc: '', args: []);
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `Edit Meal`
  String get editMeal {
    return Intl.message('Edit Meal', name: 'editMeal', desc: '', args: []);
  }

  /// `Fill the form to edit meal`
  String get fillTheFormToEditMeal {
    return Intl.message(
      'Fill the form to edit meal',
      name: 'fillTheFormToEditMeal',
      desc: '',
      args: [],
    );
  }

  /// `Meal edited!`
  String get mealEdited {
    return Intl.message('Meal edited!', name: 'mealEdited', desc: '', args: []);
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Meals list`
  String get mealsList {
    return Intl.message('Meals list', name: 'mealsList', desc: '', args: []);
  }

  /// `No meals`
  String get noMeals {
    return Intl.message('No meals', name: 'noMeals', desc: '', args: []);
  }

  /// `Meal information`
  String get mealInformation {
    return Intl.message(
      'Meal information',
      name: 'mealInformation',
      desc: '',
      args: [],
    );
  }

  /// `Grams`
  String get grams {
    return Intl.message('Grams', name: 'grams', desc: '', args: []);
  }

  /// `Milliliters`
  String get milliliters {
    return Intl.message('Milliliters', name: 'milliliters', desc: '', args: []);
  }

  /// `Select product`
  String get selectProduct {
    return Intl.message(
      'Select product',
      name: 'selectProduct',
      desc: '',
      args: [],
    );
  }

  /// `Enter ingredient amount`
  String get enterIngredientAmount {
    return Intl.message(
      'Enter ingredient amount',
      name: 'enterIngredientAmount',
      desc: '',
      args: [],
    );
  }

  /// `Enter amount`
  String get enterAmount {
    return Intl.message(
      'Enter amount',
      name: 'enterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Make sure fractional number is correct`
  String get makeSureFractionalNumberIsCorrect {
    return Intl.message(
      'Make sure fractional number is correct',
      name: 'makeSureFractionalNumberIsCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid number`
  String get enterValidNumber {
    return Intl.message(
      'Enter valid number',
      name: 'enterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Number must be non-negative`
  String get numberMustBeNonnegative {
    return Intl.message(
      'Number must be non-negative',
      name: 'numberMustBeNonnegative',
      desc: '',
      args: [],
    );
  }

  /// `New meal title`
  String get newMealTitle {
    return Intl.message(
      'New meal title',
      name: 'newMealTitle',
      desc: '',
      args: [],
    );
  }

  /// `New meal recipe (optional)`
  String get newMealRecipeOptional {
    return Intl.message(
      'New meal recipe (optional)',
      name: 'newMealRecipeOptional',
      desc: '',
      args: [],
    );
  }

  /// `No ingredients yet.\nPress 'Add ingredient' button to create one.`
  String get noIngredientsYet {
    return Intl.message(
      'No ingredients yet.\nPress \'Add ingredient\' button to create one.',
      name: 'noIngredientsYet',
      desc: '',
      args: [],
    );
  }

  /// `Add ingredient`
  String get addIngredient {
    return Intl.message(
      'Add ingredient',
      name: 'addIngredient',
      desc: '',
      args: [],
    );
  }

  /// `Create a new ingredient`
  String get createANewIngredient {
    return Intl.message(
      'Create a new ingredient',
      name: 'createANewIngredient',
      desc: '',
      args: [],
    );
  }

  /// `Enter title`
  String get enterTitle {
    return Intl.message('Enter title', name: 'enterTitle', desc: '', args: []);
  }

  /// `{ingredientAmount} ml.`
  String ingredientamountMl(Object ingredientAmount) {
    return Intl.message(
      '$ingredientAmount ml.',
      name: 'ingredientamountMl',
      desc: '',
      args: [ingredientAmount],
    );
  }

  /// `{ingredientAmount} gr.`
  String ingredientamountGr(Object ingredientAmount) {
    return Intl.message(
      '$ingredientAmount gr.',
      name: 'ingredientamountGr',
      desc: '',
      args: [ingredientAmount],
    );
  }

  /// `Are you sure you want to delete this {object}?`
  String areYouSureYouWantToDeleteThisObject(Object object) {
    return Intl.message(
      'Are you sure you want to delete this $object?',
      name: 'areYouSureYouWantToDeleteThisObject',
      desc: '',
      args: [object],
    );
  }

  /// `Ingredient editing`
  String get ingredientEditing {
    return Intl.message(
      'Ingredient editing',
      name: 'ingredientEditing',
      desc: '',
      args: [],
    );
  }

  /// `No recipe`
  String get noRecipe {
    return Intl.message('No recipe', name: 'noRecipe', desc: '', args: []);
  }

  /// `Total ingredients: {N}`
  String totalIngredientsN(Object N) {
    return Intl.message(
      'Total ingredients: $N',
      name: 'totalIngredientsN',
      desc: '',
      args: [N],
    );
  }

  /// `Product added!`
  String get productAdded {
    return Intl.message(
      'Product added!',
      name: 'productAdded',
      desc: '',
      args: [],
    );
  }

  /// `New product`
  String get newProduct {
    return Intl.message('New product', name: 'newProduct', desc: '', args: []);
  }

  /// `Fill the form to create a new product`
  String get fillTheFormToCreateANewProduct {
    return Intl.message(
      'Fill the form to create a new product',
      name: 'fillTheFormToCreateANewProduct',
      desc: '',
      args: [],
    );
  }

  /// `Product edited!`
  String get productEdited {
    return Intl.message(
      'Product edited!',
      name: 'productEdited',
      desc: '',
      args: [],
    );
  }

  /// `Edit Product`
  String get editProduct {
    return Intl.message(
      'Edit Product',
      name: 'editProduct',
      desc: '',
      args: [],
    );
  }

  /// `Fill the form to edit the product`
  String get fillTheFormToEditTheProduct {
    return Intl.message(
      'Fill the form to edit the product',
      name: 'fillTheFormToEditTheProduct',
      desc: '',
      args: [],
    );
  }

  /// `Products list`
  String get productsList {
    return Intl.message(
      'Products list',
      name: 'productsList',
      desc: '',
      args: [],
    );
  }

  /// `No products`
  String get noProducts {
    return Intl.message('No products', name: 'noProducts', desc: '', args: []);
  }

  /// `New product name`
  String get newProductName {
    return Intl.message(
      'New product name',
      name: 'newProductName',
      desc: '',
      args: [],
    );
  }

  /// `Proteins amount`
  String get proteinsAmount {
    return Intl.message(
      'Proteins amount',
      name: 'proteinsAmount',
      desc: '',
      args: [],
    );
  }

  /// `Fats amount`
  String get fatsAmount {
    return Intl.message('Fats amount', name: 'fatsAmount', desc: '', args: []);
  }

  /// `Carbohydrates amount`
  String get carbohydratesAmount {
    return Intl.message(
      'Carbohydrates amount',
      name: 'carbohydratesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Kilocalories amount`
  String get kilocaloriesAmount {
    return Intl.message(
      'Kilocalories amount',
      name: 'kilocaloriesAmount',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Interface main color`
  String get interfaceMainColor {
    return Intl.message(
      'Interface main color',
      name: 'interfaceMainColor',
      desc: '',
      args: [],
    );
  }

  /// `Select color`
  String get selectColor {
    return Intl.message(
      'Select color',
      name: 'selectColor',
      desc: '',
      args: [],
    );
  }

  /// `Interface contrast level`
  String get interfaceContrastLevel {
    return Intl.message(
      'Interface contrast level',
      name: 'interfaceContrastLevel',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message('Low', name: 'low', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `High`
  String get high {
    return Intl.message('High', name: 'high', desc: '', args: []);
  }

  /// `Exercises statistics`
  String get exercisesStatistics {
    return Intl.message(
      'Exercises statistics',
      name: 'exercisesStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Exercises are absent`
  String get exercisesAreAbsent {
    return Intl.message(
      'Exercises are absent',
      name: 'exercisesAreAbsent',
      desc: '',
      args: [],
    );
  }

  /// `New Training`
  String get newTraining {
    return Intl.message(
      'New Training',
      name: 'newTraining',
      desc: '',
      args: [],
    );
  }

  /// `Fill the form to create a new training`
  String get fillTheFormToCreateANewTraining {
    return Intl.message(
      'Fill the form to create a new training',
      name: 'fillTheFormToCreateANewTraining',
      desc: '',
      args: [],
    );
  }

  /// `Training added!`
  String get trainingAdded {
    return Intl.message(
      'Training added!',
      name: 'trainingAdded',
      desc: '',
      args: [],
    );
  }

  /// `Edit Training`
  String get editTraining {
    return Intl.message(
      'Edit Training',
      name: 'editTraining',
      desc: '',
      args: [],
    );
  }

  /// `Fill the form to edit training`
  String get fillTheFormToEditTraining {
    return Intl.message(
      'Fill the form to edit training',
      name: 'fillTheFormToEditTraining',
      desc: '',
      args: [],
    );
  }

  /// `Training edited!`
  String get trainingEdited {
    return Intl.message(
      'Training edited!',
      name: 'trainingEdited',
      desc: '',
      args: [],
    );
  }

  /// `Trainings list`
  String get trainingsList {
    return Intl.message(
      'Trainings list',
      name: 'trainingsList',
      desc: '',
      args: [],
    );
  }

  /// `No trainings`
  String get noTrainings {
    return Intl.message(
      'No trainings',
      name: 'noTrainings',
      desc: '',
      args: [],
    );
  }

  /// `Training information`
  String get trainingInformation {
    return Intl.message(
      'Training information',
      name: 'trainingInformation',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get training {
    return Intl.message('Training', name: 'training', desc: '', args: []);
  }

  /// `No description`
  String get noDescription {
    return Intl.message(
      'No description',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `No exercises yet.\nPress 'Add exercise' button to create one.`
  String get noExercisesYetPress {
    return Intl.message(
      'No exercises yet.\nPress \'Add exercise\' button to create one.',
      name: 'noExercisesYetPress',
      desc: '',
      args: [],
    );
  }

  /// `No exercises yet.`
  String get noExercisesYet {
    return Intl.message(
      'No exercises yet.',
      name: 'noExercisesYet',
      desc: '',
      args: [],
    );
  }

  /// `Start training`
  String get startTraining {
    return Intl.message(
      'Start training',
      name: 'startTraining',
      desc: '',
      args: [],
    );
  }

  /// `Finish training`
  String get finishTraining {
    return Intl.message(
      'Finish training',
      name: 'finishTraining',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message('Finish', name: 'finish', desc: '', args: []);
  }

  /// `New exercise title`
  String get newExerciseTitle {
    return Intl.message(
      'New exercise title',
      name: 'newExerciseTitle',
      desc: '',
      args: [],
    );
  }

  /// `New exercise description (optional)`
  String get newExerciseDescriptionOptional {
    return Intl.message(
      'New exercise description (optional)',
      name: 'newExerciseDescriptionOptional',
      desc: '',
      args: [],
    );
  }

  /// `Enter sets count`
  String get enterSetsCount {
    return Intl.message(
      'Enter sets count',
      name: 'enterSetsCount',
      desc: '',
      args: [],
    );
  }

  /// `Enter reps count`
  String get enterRepsCount {
    return Intl.message(
      'Enter reps count',
      name: 'enterRepsCount',
      desc: '',
      args: [],
    );
  }

  /// `New training title`
  String get newTrainingTitle {
    return Intl.message(
      'New training title',
      name: 'newTrainingTitle',
      desc: '',
      args: [],
    );
  }

  /// `New training description (optional)`
  String get newTrainingDescriptionOptional {
    return Intl.message(
      'New training description (optional)',
      name: 'newTrainingDescriptionOptional',
      desc: '',
      args: [],
    );
  }

  /// `Add exercise`
  String get addExercise {
    return Intl.message(
      'Add exercise',
      name: 'addExercise',
      desc: '',
      args: [],
    );
  }

  /// `Create a new exercise`
  String get createANewExercise {
    return Intl.message(
      'Create a new exercise',
      name: 'createANewExercise',
      desc: '',
      args: [],
    );
  }

  /// `Enter integer number`
  String get enterIntegerNumber {
    return Intl.message(
      'Enter integer number',
      name: 'enterIntegerNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid integer number`
  String get enterValidIntegerNumber {
    return Intl.message(
      'Enter valid integer number',
      name: 'enterValidIntegerNumber',
      desc: '',
      args: [],
    );
  }

  /// `{sets} set(s) of {duration}`
  String setsSetsOfDuration(Object sets, Object duration) {
    return Intl.message(
      '$sets set(s) of $duration',
      name: 'setsSetsOfDuration',
      desc: '',
      args: [sets, duration],
    );
  }

  /// `{sets} set(s) of {N} rep(s)`
  String setsSetsOfNReps(Object sets, Object N) {
    return Intl.message(
      '$sets set(s) of $N rep(s)',
      name: 'setsSetsOfNReps',
      desc: '',
      args: [sets, N],
    );
  }

  /// `Exercise editing`
  String get exerciseEditing {
    return Intl.message(
      'Exercise editing',
      name: 'exerciseEditing',
      desc: '',
      args: [],
    );
  }

  /// `Add some exercises to start this training`
  String get addSomeExercisesToStartThisTraining {
    return Intl.message(
      'Add some exercises to start this training',
      name: 'addSomeExercisesToStartThisTraining',
      desc: '',
      args: [],
    );
  }

  /// `Watch Statistics`
  String get watchStatistics {
    return Intl.message(
      'Watch Statistics',
      name: 'watchStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Edit weight`
  String get editWeight {
    return Intl.message('Edit weight', name: 'editWeight', desc: '', args: []);
  }

  /// `Here you can change your current weight`
  String get hereYouCanChangeYourCurrentWeight {
    return Intl.message(
      'Here you can change your current weight',
      name: 'hereYouCanChangeYourCurrentWeight',
      desc: '',
      args: [],
    );
  }

  /// `Weight updated!`
  String get weightUpdated {
    return Intl.message(
      'Weight updated!',
      name: 'weightUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Your current weight is:`
  String get yourCurrentWeightIs {
    return Intl.message(
      'Your current weight is:',
      name: 'yourCurrentWeightIs',
      desc: '',
      args: [],
    );
  }

  /// `Change weight`
  String get changeWeight {
    return Intl.message(
      'Change weight',
      name: 'changeWeight',
      desc: '',
      args: [],
    );
  }

  /// `Enter your weight`
  String get enterYourWeight {
    return Intl.message(
      'Enter your weight',
      name: 'enterYourWeight',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Interface language`
  String get interfaceLanguage {
    return Intl.message(
      'Interface language',
      name: 'interfaceLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Create product`
  String get createProduct {
    return Intl.message(
      'Create product',
      name: 'createProduct',
      desc: '',
      args: [],
    );
  }

  /// `No products yet.\n Tap 'Plus' button to create a new product`
  String get noProductsYetnPressPlusButtonToCreateANew {
    return Intl.message(
      'No products yet.\n Tap \'Plus\' button to create a new product',
      name: 'noProductsYetnPressPlusButtonToCreateANew',
      desc: '',
      args: [],
    );
  }

  /// `No meals yet.\n Tap 'Plus' button to create a new meal`
  String get noMealsYetnPressPlusButtonToCreateANew {
    return Intl.message(
      'No meals yet.\n Tap \'Plus\' button to create a new meal',
      name: 'noMealsYetnPressPlusButtonToCreateANew',
      desc: '',
      args: [],
    );
  }

  /// `No trainings yet. \n Tap 'Plus' icon to create a new training`
  String get noTrainingsYetNTapPlusIconToCreateA {
    return Intl.message(
      'No trainings yet. \n Tap \'Plus\' icon to create a new training',
      name: 'noTrainingsYetNTapPlusIconToCreateA',
      desc: '',
      args: [],
    );
  }

  /// `Statistics of {exerciseTitle}`
  String statisticsOfExercisetitle(Object exerciseTitle) {
    return Intl.message(
      'Statistics of $exerciseTitle',
      name: 'statisticsOfExercisetitle',
      desc: '',
      args: [exerciseTitle],
    );
  }

  /// `No Statistics for this exercise yet.\nTo get it's statistics, complete a training this exercise is a part of.`
  String get noStatisticsForThisExerciseYetntoMakeStatisticsOfThis {
    return Intl.message(
      'No Statistics for this exercise yet.\nTo get it\'s statistics, complete a training this exercise is a part of.',
      name: 'noStatisticsForThisExerciseYetntoMakeStatisticsOfThis',
      desc: '',
      args: [],
    );
  }

  /// `Select language`
  String get selectLanguage {
    return Intl.message(
      'Select language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `An error occurred`
  String get anErrorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Exercise added`
  String get exerciseAdded {
    return Intl.message(
      'Exercise added',
      name: 'exerciseAdded',
      desc: '',
      args: [],
    );
  }

  /// `Create training`
  String get createTraining {
    return Intl.message(
      'Create training',
      name: 'createTraining',
      desc: '',
      args: [],
    );
  }

  /// `Create meal`
  String get createMeal {
    return Intl.message('Create meal', name: 'createMeal', desc: '', args: []);
  }

  /// `No products!\nCreate a product first to add it as an ingredient.`
  String get noProductsncreateAProductFirstToAddItAsAn {
    return Intl.message(
      'No products!\nCreate a product first to add it as an ingredient.',
      name: 'noProductsncreateAProductFirstToAddItAsAn',
      desc: '',
      args: [],
    );
  }

  /// `Go to products`
  String get goToProducts {
    return Intl.message(
      'Go to products',
      name: 'goToProducts',
      desc: '',
      args: [],
    );
  }

  /// `Measurement unit:`
  String get measurementUnit {
    return Intl.message(
      'Measurement unit:',
      name: 'measurementUnit',
      desc: '',
      args: [],
    );
  }

  /// `Could not load user data.`
  String get couldNotLoadUserData {
    return Intl.message(
      'Could not load user data.',
      name: 'couldNotLoadUserData',
      desc: '',
      args: [],
    );
  }

  /// `Could not create user.`
  String get couldNotCreateUser {
    return Intl.message(
      'Could not create user.',
      name: 'couldNotCreateUser',
      desc: '',
      args: [],
    );
  }

  /// `Could not update user weight.`
  String get couldNotUpdateUserWeight {
    return Intl.message(
      'Could not update user weight.',
      name: 'couldNotUpdateUserWeight',
      desc: '',
      args: [],
    );
  }

  /// `Could not create a new training.`
  String get couldNotCreateANewTraining {
    return Intl.message(
      'Could not create a new training.',
      name: 'couldNotCreateANewTraining',
      desc: '',
      args: [],
    );
  }

  /// `Could not delete training.`
  String get couldNotDeleteTraining {
    return Intl.message(
      'Could not delete training.',
      name: 'couldNotDeleteTraining',
      desc: '',
      args: [],
    );
  }

  /// `Could not edit training.`
  String get couldNotEditTraining {
    return Intl.message(
      'Could not edit training.',
      name: 'couldNotEditTraining',
      desc: '',
      args: [],
    );
  }

  /// `Could not add exercise in training.`
  String get couldNotAddExerciseInTraining {
    return Intl.message(
      'Could not add exercise in training.',
      name: 'couldNotAddExerciseInTraining',
      desc: '',
      args: [],
    );
  }

  /// `Could not edit exercise in training.`
  String get couldNotEditExerciseInTraining {
    return Intl.message(
      'Could not edit exercise in training.',
      name: 'couldNotEditExerciseInTraining',
      desc: '',
      args: [],
    );
  }

  /// `Could not delete exercise from training.`
  String get couldNotDeleteExerciseFromTraining {
    return Intl.message(
      'Could not delete exercise from training.',
      name: 'couldNotDeleteExerciseFromTraining',
      desc: '',
      args: [],
    );
  }

  /// `Could not update training data.`
  String get couldNotCompleteTraining {
    return Intl.message(
      'Could not update training data.',
      name: 'couldNotCompleteTraining',
      desc: '',
      args: [],
    );
  }

  /// `Could not create a new meal`
  String get couldNotCreateANewMeal {
    return Intl.message(
      'Could not create a new meal',
      name: 'couldNotCreateANewMeal',
      desc: '',
      args: [],
    );
  }

  /// `Could not delete meal.`
  String get couldNotDeleteMeal {
    return Intl.message(
      'Could not delete meal.',
      name: 'couldNotDeleteMeal',
      desc: '',
      args: [],
    );
  }

  /// `Could not edit meal.`
  String get couldNotEditMeal {
    return Intl.message(
      'Could not edit meal.',
      name: 'couldNotEditMeal',
      desc: '',
      args: [],
    );
  }

  /// `Could not add ingredient in meal.`
  String get couldNotAddIngredientInMeal {
    return Intl.message(
      'Could not add ingredient in meal.',
      name: 'couldNotAddIngredientInMeal',
      desc: '',
      args: [],
    );
  }

  /// `Could not edit ingredient in meal.`
  String get couldNotEditIngredientInMeal {
    return Intl.message(
      'Could not edit ingredient in meal.',
      name: 'couldNotEditIngredientInMeal',
      desc: '',
      args: [],
    );
  }

  /// `Could not delete ingredient from meal.`
  String get couldNotDeleteIngredientFromMeal {
    return Intl.message(
      'Could not delete ingredient from meal.',
      name: 'couldNotDeleteIngredientFromMeal',
      desc: '',
      args: [],
    );
  }

  /// `Could not create a new product.`
  String get couldNotCreateANewProduct {
    return Intl.message(
      'Could not create a new product.',
      name: 'couldNotCreateANewProduct',
      desc: '',
      args: [],
    );
  }

  /// `Could not edit product`
  String get couldNotEditProduct {
    return Intl.message(
      'Could not edit product',
      name: 'couldNotEditProduct',
      desc: '',
      args: [],
    );
  }

  /// `Could not delete product.`
  String get couldNotDeleteProduct {
    return Intl.message(
      'Could not delete product.',
      name: 'couldNotDeleteProduct',
      desc: '',
      args: [],
    );
  }

  /// `Training deleted.`
  String get trainingDeleted {
    return Intl.message(
      'Training deleted.',
      name: 'trainingDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Training finished.`
  String get trainingFinished {
    return Intl.message(
      'Training finished.',
      name: 'trainingFinished',
      desc: '',
      args: [],
    );
  }

  /// `Meal deleted.`
  String get mealDeleted {
    return Intl.message(
      'Meal deleted.',
      name: 'mealDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Product deleted.`
  String get productDeleted {
    return Intl.message(
      'Product deleted.',
      name: 'productDeleted',
      desc: '',
      args: [],
    );
  }

  /// `ingredient`
  String get ingredient {
    return Intl.message('ingredient', name: 'ingredient', desc: '', args: []);
  }

  /// `meal`
  String get meal {
    return Intl.message('meal', name: 'meal', desc: '', args: []);
  }

  /// `product`
  String get product {
    return Intl.message('product', name: 'product', desc: '', args: []);
  }

  /// `exercise`
  String get exercise {
    return Intl.message('exercise', name: 'exercise', desc: '', args: []);
  }

  /// `Tap to open timer`
  String get tapToOpenTimer {
    return Intl.message(
      'Tap to open timer',
      name: 'tapToOpenTimer',
      desc: '',
      args: [],
    );
  }

  /// `Mark as completed`
  String get markAsCompleted {
    return Intl.message(
      'Mark as completed',
      name: 'markAsCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Exercise information`
  String get exerciseInformation {
    return Intl.message(
      'Exercise information',
      name: 'exerciseInformation',
      desc: '',
      args: [],
    );
  }

  /// `Good work!\nYour training progress has been updated!`
  String get goodWorknYourTrainingProgressHasBeenUpdated {
    return Intl.message(
      'Good work!\nYour training progress has been updated!',
      name: 'goodWorknYourTrainingProgressHasBeenUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Check statistics`
  String get checkStatistics {
    return Intl.message(
      'Check statistics',
      name: 'checkStatistics',
      desc: '',
      args: [],
    );
  }

  /// `100 {measurement} contain:`
  String hundredMeasurementContain(Object measurement) {
    return Intl.message(
      '100 $measurement contain:',
      name: 'hundredMeasurementContain',
      desc: '',
      args: [measurement],
    );
  }

  /// `ml.`
  String get millilitersShort {
    return Intl.message('ml.', name: 'millilitersShort', desc: '', args: []);
  }

  /// `gr.`
  String get gramsShort {
    return Intl.message('gr.', name: 'gramsShort', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
