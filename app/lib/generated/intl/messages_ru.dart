// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m1(measurement) => "100 ${measurement} содержат:";

  static String m2(ingredientAmount) => "${ingredientAmount} гр.";

  static String m3(ingredientAmount) => "${ingredientAmount} мл.";

  static String m4(sets, duration) => "${sets} подход(-а/-ов) по ${duration}";

  static String m5(sets, N) => "${sets} повтор(-а/-ов) по ${N} повторен.";

  static String m6(exerciseTitle) => "Статистика ${exerciseTitle}";

  static String m7(N) => "Всего ингредиентов: ${N}";

  static String m8(userWeight) => "Ваш вес: ${userWeight}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addExercise":
            MessageLookupByLibrary.simpleMessage("Добавить упражнение"),
        "addIngredient": MessageLookupByLibrary.simpleMessage(
          "Добавить ингредиент",
        ),
        "addSomeExercisesToStartThisTraining":
            MessageLookupByLibrary.simpleMessage(
          "Добавьте упражнения, чтобы начать уту тренировку",
        ),
        "anErrorOccurred":
            MessageLookupByLibrary.simpleMessage("Произошла ошибка"),
        "apply": MessageLookupByLibrary.simpleMessage("Подтвердить"),
        "back": MessageLookupByLibrary.simpleMessage("назад"),
        "carbohydrates": MessageLookupByLibrary.simpleMessage("Углеводы"),
        "carbohydratesAmount": MessageLookupByLibrary.simpleMessage(
          "Количество углеводов",
        ),
        "changeWeight": MessageLookupByLibrary.simpleMessage("Изменить вес"),
        "checkStatistics": MessageLookupByLibrary.simpleMessage(
          "Перейти к статистике",
        ),
        "couldNotAddExerciseInTraining": MessageLookupByLibrary.simpleMessage(
          "Не удалось добавить упражнение в тренировку.",
        ),
        "couldNotAddIngredientInMeal": MessageLookupByLibrary.simpleMessage(
          "Не удалось добавить ингредиент в блюдо.",
        ),
        "couldNotCompleteTraining": MessageLookupByLibrary.simpleMessage(
          "Не удалось обновить данные тренировки.",
        ),
        "couldNotCreateANewMeal": MessageLookupByLibrary.simpleMessage(
          "Не удалось создать новое бюлдо.",
        ),
        "couldNotCreateANewProduct": MessageLookupByLibrary.simpleMessage(
          "Не удалось создать новый продукт.",
        ),
        "couldNotCreateANewTraining": MessageLookupByLibrary.simpleMessage(
          "Не удалось создать новую тренировку.",
        ),
        "couldNotCreateUser": MessageLookupByLibrary.simpleMessage(
          "Не удалось создать пользователя.",
        ),
        "couldNotDeleteExerciseFromTraining":
            MessageLookupByLibrary.simpleMessage(
          "Не удалось удалить упражнение из тренировки.",
        ),
        "couldNotDeleteIngredientFromMeal":
            MessageLookupByLibrary.simpleMessage(
          "Не удалось удалить ингредиент из блюда.",
        ),
        "couldNotDeleteMeal": MessageLookupByLibrary.simpleMessage(
          "Не удалось удалить блюдо.",
        ),
        "couldNotDeleteProduct": MessageLookupByLibrary.simpleMessage(
          "Не удалось удалить продукт.",
        ),
        "couldNotDeleteTraining": MessageLookupByLibrary.simpleMessage(
          "Не удалось удалить тренировку.",
        ),
        "couldNotEditExerciseInTraining": MessageLookupByLibrary.simpleMessage(
          "Не удалось измениить упражнение в тренировке.",
        ),
        "couldNotEditIngredientInMeal": MessageLookupByLibrary.simpleMessage(
          "Не удалось изменить ингредиент в блюде.",
        ),
        "couldNotEditMeal": MessageLookupByLibrary.simpleMessage(
          "Не удалось изменить блюдо.",
        ),
        "couldNotEditProduct": MessageLookupByLibrary.simpleMessage(
          "Не удалось изменить продукт.",
        ),
        "couldNotEditTraining": MessageLookupByLibrary.simpleMessage(
          "Не удалось изменить тренировку.",
        ),
        "couldNotLoadUserData": MessageLookupByLibrary.simpleMessage(
          "Не удалось загрузить данные пользователя.",
        ),
        "couldNotUpdateUserWeight": MessageLookupByLibrary.simpleMessage(
          "Не удалось изменить вес пользователя.",
        ),
        "create": MessageLookupByLibrary.simpleMessage("Создать"),
        "createANewExercise": MessageLookupByLibrary.simpleMessage(
          "Создать новое упражнение",
        ),
        "createANewIngredient": MessageLookupByLibrary.simpleMessage(
          "Создать новый ингредиент",
        ),
        "createMeal": MessageLookupByLibrary.simpleMessage("Создать блюдо"),
        "createProduct":
            MessageLookupByLibrary.simpleMessage("Создать продукт"),
        "createTraining": MessageLookupByLibrary.simpleMessage(
          "Создать тренировку",
        ),
        "darkMode": MessageLookupByLibrary.simpleMessage("Тёмный режим"),
        "date": MessageLookupByLibrary.simpleMessage("Дата"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "deletion": MessageLookupByLibrary.simpleMessage("Удаление"),
        "dragLeftSideRightToOpenMenu": MessageLookupByLibrary.simpleMessage(
          "Потяните левую часть направо, чтобы отрыть меню.",
        ),
        "edit": MessageLookupByLibrary.simpleMessage("Изменить"),
        "editMeal": MessageLookupByLibrary.simpleMessage("Изменить Блюдо"),
        "editProduct": MessageLookupByLibrary.simpleMessage("Изменить Продукт"),
        "editTraining":
            MessageLookupByLibrary.simpleMessage("Изменить тренировку"),
        "editWeight": MessageLookupByLibrary.simpleMessage("Изменение веса"),
        "enterAmount": MessageLookupByLibrary.simpleMessage("Введите кол-во"),
        "enterIngredientAmount": MessageLookupByLibrary.simpleMessage(
          "Введите кол-во ингредиента",
        ),
        "enterIntegerNumber": MessageLookupByLibrary.simpleMessage(
          "Введите целое число",
        ),
        "enterRepsCount": MessageLookupByLibrary.simpleMessage(
          "Введите количество повторений",
        ),
        "enterSetsCount": MessageLookupByLibrary.simpleMessage(
          "Введите количество подходов",
        ),
        "enterTitle": MessageLookupByLibrary.simpleMessage("Введите название"),
        "enterValidIntegerNumber": MessageLookupByLibrary.simpleMessage(
          "Введите целое число правильно",
        ),
        "enterValidNumber": MessageLookupByLibrary.simpleMessage(
          "Введите правильное число",
        ),
        "enterYourWeight":
            MessageLookupByLibrary.simpleMessage("Введите ваш вес"),
        "exercise": MessageLookupByLibrary.simpleMessage("упражнение"),
        "exerciseAdded": MessageLookupByLibrary.simpleMessage(
          "Упражнение добавлено",
        ),
        "exerciseEditing": MessageLookupByLibrary.simpleMessage(
          "Изменение упражнения",
        ),
        "exerciseInformation": MessageLookupByLibrary.simpleMessage(
          "Информация об упражнении",
        ),
        "exercisesAreAbsent": MessageLookupByLibrary.simpleMessage(
          "Упражнения отсутствуют",
        ),
        "exercisesStatistics": MessageLookupByLibrary.simpleMessage(
          "Статистика упражнений",
        ),
        "exit": MessageLookupByLibrary.simpleMessage("Выйти"),
        "fats": MessageLookupByLibrary.simpleMessage("Жиры"),
        "fatsAmount": MessageLookupByLibrary.simpleMessage("Количество жиров"),
        "fillTheFormToCreateANewMeal": MessageLookupByLibrary.simpleMessage(
          "Заполните форму, чтобы создать новое блюдо",
        ),
        "fillTheFormToCreateANewProduct": MessageLookupByLibrary.simpleMessage(
          "Заполните форму, чтобы создать новый продукт",
        ),
        "fillTheFormToCreateANewTraining": MessageLookupByLibrary.simpleMessage(
          "Заполните форму, чтобы создать новую тренировку",
        ),
        "fillTheFormToEditMeal": MessageLookupByLibrary.simpleMessage(
          "Заполните форму, чтобы изменить блюдо",
        ),
        "fillTheFormToEditTheProduct": MessageLookupByLibrary.simpleMessage(
          "Заполните форму, чтобы изменить продукт",
        ),
        "fillTheFormToEditTraining": MessageLookupByLibrary.simpleMessage(
          "Заполните форму, чтобы изменить тренировку",
        ),
        "finish": MessageLookupByLibrary.simpleMessage("Закончить"),
        "finishTraining": MessageLookupByLibrary.simpleMessage(
          "Закончить тренировку",
        ),
        "goToProducts":
            MessageLookupByLibrary.simpleMessage("Перейти к продуктам"),
        "goodWorknYourTrainingProgressHasBeenUpdated":
            MessageLookupByLibrary.simpleMessage(
          "Хорошая работа!\nВаш тренировочный прогресс был обновлён!",
        ),
        "grams": MessageLookupByLibrary.simpleMessage("Граммы"),
        "gramsShort": MessageLookupByLibrary.simpleMessage("гр."),
        "hereYouCanChangeYourCurrentWeight":
            MessageLookupByLibrary.simpleMessage(
          "Здесь вы можете изменить свой вес",
        ),
        "high": MessageLookupByLibrary.simpleMessage("Высокий"),
        "home": MessageLookupByLibrary.simpleMessage("Домой"),
        "hundredMeasurementContain": m1,
        "ingredient": MessageLookupByLibrary.simpleMessage("ингредиент"),
        "ingredientEditing": MessageLookupByLibrary.simpleMessage(
          "Изменение ингредиента",
        ),
        "ingredientamountGr": m2,
        "ingredientamountMl": m3,
        "interfaceContrastLevel": MessageLookupByLibrary.simpleMessage(
          "Уровень контраста интерфейса",
        ),
        "interfaceLanguage": MessageLookupByLibrary.simpleMessage(
          "Язык интерфейса",
        ),
        "interfaceMainColor": MessageLookupByLibrary.simpleMessage(
          "Главный цвет интерфейса",
        ),
        "kilocalories": MessageLookupByLibrary.simpleMessage("Килокалории"),
        "kilocaloriesAmount": MessageLookupByLibrary.simpleMessage(
          "Количество килокалорий",
        ),
        "low": MessageLookupByLibrary.simpleMessage("Низкий"),
        "makeSureFractionalNumberIsCorrect":
            MessageLookupByLibrary.simpleMessage(
          "Убедитесь, что дробь написана правильно",
        ),
        "markAsCompleted": MessageLookupByLibrary.simpleMessage(
          "Отметить как выполненное",
        ),
        "meal": MessageLookupByLibrary.simpleMessage("блюдо"),
        "mealAdded": MessageLookupByLibrary.simpleMessage("Блюдо добавлено!"),
        "mealDeleted": MessageLookupByLibrary.simpleMessage("Блюдо удалено."),
        "mealEdited": MessageLookupByLibrary.simpleMessage("Блюдо изменено!"),
        "mealInformation": MessageLookupByLibrary.simpleMessage(
          "Инофрмация о блюде",
        ),
        "meals": MessageLookupByLibrary.simpleMessage("Блюда"),
        "mealsList": MessageLookupByLibrary.simpleMessage("Список блюд"),
        "measurementUnit": MessageLookupByLibrary.simpleMessage(
          "Единицы измерения:",
        ),
        "medium": MessageLookupByLibrary.simpleMessage("Средний"),
        "milliliters": MessageLookupByLibrary.simpleMessage("Миллилитры"),
        "millilitersShort": MessageLookupByLibrary.simpleMessage("мл."),
        "newExerciseDescriptionOptional": MessageLookupByLibrary.simpleMessage(
          "Описание нового упражнения (необязательно)",
        ),
        "newExerciseTitle": MessageLookupByLibrary.simpleMessage(
          "Название нового упражнения",
        ),
        "newMeal": MessageLookupByLibrary.simpleMessage("Новое Блюдо"),
        "newMealRecipeOptional": MessageLookupByLibrary.simpleMessage(
          "Рецепт нового блюда (необязательно)",
        ),
        "newMealTitle": MessageLookupByLibrary.simpleMessage(
          "Название нового блюда",
        ),
        "newProduct": MessageLookupByLibrary.simpleMessage("Новый продукт"),
        "newProductName": MessageLookupByLibrary.simpleMessage(
          "Название нового продукта",
        ),
        "newTraining": MessageLookupByLibrary.simpleMessage("Новая тренировка"),
        "newTrainingDescriptionOptional": MessageLookupByLibrary.simpleMessage(
          "Описание новой тренировки (необязательно)",
        ),
        "newTrainingTitle": MessageLookupByLibrary.simpleMessage(
          "Название новой тренировки",
        ),
        "next": MessageLookupByLibrary.simpleMessage("далее"),
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "noDescription": MessageLookupByLibrary.simpleMessage(
          "Описание отсутствует",
        ),
        "noExercisesYet": MessageLookupByLibrary.simpleMessage(
          "Ещё нет упражнений.",
        ),
        "noExercisesYetPress": MessageLookupByLibrary.simpleMessage(
          "Ещё нет упражнений.\nНажмите кнопку \'Добавить упражнение\' для добавления",
        ),
        "noIngredientsYet": MessageLookupByLibrary.simpleMessage(
          "Ещё нет ингредиентов.\nНажмите кнопку \'Добавить ингредиент\' для добавления",
        ),
        "noMeals": MessageLookupByLibrary.simpleMessage("Нет блюд"),
        "noMealsYetnPressPlusButtonToCreateANew":
            MessageLookupByLibrary.simpleMessage(
          "Пока блюд нет.\n Нажмите иконку плюса, чтобы создать новое блюдо",
        ),
        "noProducts": MessageLookupByLibrary.simpleMessage("Нет продуктов"),
        "noProductsYetnPressPlusButtonToCreateANew":
            MessageLookupByLibrary.simpleMessage(
          "Пока продуктов нет.\n Нажмите иконку плюса, чтобы создать новый продукт",
        ),
        "noProductsncreateAProductFirstToAddItAsAn":
            MessageLookupByLibrary.simpleMessage(
          "Нет продуктов!\nСначала создайте продукт, чтобы добавить его как ингредиент.",
        ),
        "noRecipe": MessageLookupByLibrary.simpleMessage("Рецепт отсутствует"),
        "noStatisticsForThisExerciseYetntoMakeStatisticsOfThis":
            MessageLookupByLibrary.simpleMessage(
          "Пока нет Статистики по этому упражнению.\nЧтобы получить его статистику, завершите тренировку, в которую оно входит.",
        ),
        "noTrainings": MessageLookupByLibrary.simpleMessage("Нет тренировок"),
        "noTrainingsYetNTapPlusIconToCreateA":
            MessageLookupByLibrary.simpleMessage(
          "Пока тренировок нет. \n Нажмите иконку плюса, чтобы создать новую тренировку",
        ),
        "numberMustBeNonnegative": MessageLookupByLibrary.simpleMessage(
          "Число должно быть неотрицательным",
        ),
        "product": MessageLookupByLibrary.simpleMessage("продукт"),
        "productAdded":
            MessageLookupByLibrary.simpleMessage("Продукт добавлен!"),
        "productDeleted":
            MessageLookupByLibrary.simpleMessage("Продукт удалён."),
        "productEdited":
            MessageLookupByLibrary.simpleMessage("Продукт изменён!"),
        "products": MessageLookupByLibrary.simpleMessage("Продукты"),
        "productsList":
            MessageLookupByLibrary.simpleMessage("Список продуктов"),
        "proteins": MessageLookupByLibrary.simpleMessage("Белки"),
        "proteinsAmount":
            MessageLookupByLibrary.simpleMessage("Количество белков"),
        "reps": MessageLookupByLibrary.simpleMessage("Повторы"),
        "saveChanges":
            MessageLookupByLibrary.simpleMessage("Сохранить изменения"),
        "selectColor": MessageLookupByLibrary.simpleMessage("Выберите цвет"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("Выберите язык"),
        "selectProduct":
            MessageLookupByLibrary.simpleMessage("Выберите продукт"),
        "setsSetsOfDuration": m4,
        "setsSetsOfNReps": m5,
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "startTraining":
            MessageLookupByLibrary.simpleMessage("Начать тренировку"),
        "statisticsOfExercisetitle": m6,
        "tapToOpenTimer": MessageLookupByLibrary.simpleMessage(
          "Нажмите, чтобы открыть таймер",
        ),
        "thisExercise": MessageLookupByLibrary.simpleMessage("это упражнение"),
        "thisIngredient":
            MessageLookupByLibrary.simpleMessage("этот ингредиент"),
        "thisMeal": MessageLookupByLibrary.simpleMessage("это блюдо"),
        "thisProduct": MessageLookupByLibrary.simpleMessage("этот продукт"),
        "thisTraining": MessageLookupByLibrary.simpleMessage("эту тренировку"),
        "timer": MessageLookupByLibrary.simpleMessage("Таймер"),
        "totalIngredientsN": m7,
        "training": MessageLookupByLibrary.simpleMessage("Тренировка"),
        "trainingAdded": MessageLookupByLibrary.simpleMessage(
          "Тренировка добавлена!",
        ),
        "trainingDeleted": MessageLookupByLibrary.simpleMessage(
          "Тренировка удалена.",
        ),
        "trainingEdited": MessageLookupByLibrary.simpleMessage(
          "Тренировка изменена!",
        ),
        "trainingFinished": MessageLookupByLibrary.simpleMessage(
          "Тренировка завершена.",
        ),
        "trainingInformation": MessageLookupByLibrary.simpleMessage(
          "Инофрмация о тренировке",
        ),
        "trainings": MessageLookupByLibrary.simpleMessage("Тренировки"),
        "trainingsList":
            MessageLookupByLibrary.simpleMessage("Список тренировок"),
        "watchStatistics": MessageLookupByLibrary.simpleMessage(
          "Смотреть статистику",
        ),
        "weightUpdated": MessageLookupByLibrary.simpleMessage("Вес изменён!"),
        "yes": MessageLookupByLibrary.simpleMessage("Да"),
        "yourCurrentWeightIs": MessageLookupByLibrary.simpleMessage("Ваш вес:"),
        "yourCurrentWeightN": m8,
      };
}
