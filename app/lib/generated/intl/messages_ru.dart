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

  static String m0(object) => "Вы уверены, что хотите удалить ${object}?";

  static String m1(ingredientAmount) => "${ingredientAmount} гр.";

  static String m2(ingredientAmount) => "${ingredientAmount} мл.";

  static String m3(sets, duration) => "${sets} подход(-а/-ов) по ${duration}";

  static String m4(sets, N) => "${sets} повтор(-а/-ов) по ${N} повторен.";

  static String m5(exerciseTitle) => "Статистика ${exerciseTitle}";

  static String m6(N) => "Всего ингредиентов: ${N}";

  static String m7(userWeight) => "Ваш вес: ${userWeight}";

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
        "areYouSureYouWantToDeleteThisObject": m0,
        "carbohydrates": MessageLookupByLibrary.simpleMessage("Углеводы"),
        "carbohydratesAmount": MessageLookupByLibrary.simpleMessage(
          "Количество углеводов",
        ),
        "changeWeight": MessageLookupByLibrary.simpleMessage("Изменить вес"),
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
        "exerciseAdded": MessageLookupByLibrary.simpleMessage(
          "Упражнение добавлено",
        ),
        "exerciseEditing": MessageLookupByLibrary.simpleMessage(
          "Изменение упражнения",
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
        "grams": MessageLookupByLibrary.simpleMessage("Граммы"),
        "hereYouCanChangeYourCurrentWeight":
            MessageLookupByLibrary.simpleMessage(
          "Здесь вы можете изменить свой вес",
        ),
        "high": MessageLookupByLibrary.simpleMessage("Высокий"),
        "home": MessageLookupByLibrary.simpleMessage("Домой"),
        "ingredientEditing": MessageLookupByLibrary.simpleMessage(
          "Изменение ингредиента",
        ),
        "ingredientamountGr": m1,
        "ingredientamountMl": m2,
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
        "mealAdded": MessageLookupByLibrary.simpleMessage("Блюдо добавлено!"),
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
        "no": MessageLookupByLibrary.simpleMessage("Нет"),
        "noDescription": MessageLookupByLibrary.simpleMessage(
          "Описание отсутствует",
        ),
        "noExercisesYet": MessageLookupByLibrary.simpleMessage(
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
        "productAdded":
            MessageLookupByLibrary.simpleMessage("Продукт добавлен!"),
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
        "setsSetsOfDuration": m3,
        "setsSetsOfNReps": m4,
        "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "startTraining":
            MessageLookupByLibrary.simpleMessage("Начать тренировку"),
        "statisticsOfExercisetitle": m5,
        "timer": MessageLookupByLibrary.simpleMessage("Таймер"),
        "totalIngredientsN": m6,
        "training": MessageLookupByLibrary.simpleMessage("Тренировка"),
        "trainingAdded": MessageLookupByLibrary.simpleMessage(
          "Тренировка добавлена!",
        ),
        "trainingEdited": MessageLookupByLibrary.simpleMessage(
          "Тренировка изменена!",
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
        "yourCurrentWeightN": m7,
      };
}
