import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

const user1Json = '''
{
  "id": "5ca629eb-0775-4f36-8ba7-8e32d22926be",
  "weight": 80,
  "trainings": [],
  "meals": [],
  "products": []
}
''';

const user2Json = '''
{
  "id": "43a629eb-0775-4f36-8ba7-8e32d2292611",
  "weight": 85,
  "trainings": [
    {
      "id": "a1a629eb-0775-4f36-8ba7-8e32d229265c",
      "title": "Training 1 title",
      "description": "training 1 description",
      "exercises": [
        {
          "id": "4da629eb-0775-4f36-8ba7-8e32d229265b",
          "title": "exercise1omg",
          "description": "super description omg",
          "sets": 3,
          "statistics": [
            {
              "load": {
                "repsAmount": 10, 
                "type": "repetition"
              }, 
              "date": "2025-01-22T14:46:08.600820"
            },
            {
              "load": {
                "repsAmount": 10, 
                "type": "repetition"
              }, 
              "date": "2025-02-22T14:46:08.600820"
            },
            {
              "load": {
                "repsAmount": 12, 
                "type": "repetition"
              }, 
              "date": "2025-03-30T14:46:08.600820"
            }
          ],
          "load": {
            "repsAmount": 15, 
            "type": "repetition"
          }
        },
        {
          "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
          "title": "exercise2omg",
          "description": null,
          "sets": 3,
          "statistics": [],
          "load": {
            "duration": 20000000, 
            "type": "timer"
          }
        },
        {
          "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
          "title": "exercise3omg",
          "description": "super description",
          "sets": 2,
          "statistics": [
            {
              "load": {
                "duration": 20000000,
                "type": "timer"
              }, 
              "date": "2025-01-22T14:46:08.600820"
            },
            {
              "load": {
                "duration": 20000000, 
                "type": "timer"
              }, 
              "date": "2025-02-22T14:46:08.600820"
            },
            {
              "load": {
                "duration": 25000000, 
                "type": "timer"
              }, 
              "date": "2025-03-30T14:46:08.600820"
            }
          ],
          "load": {
            "duration": 25000000, 
            "type": "timer"
          }
        }
      ]
    },
    {
      "id": "22a629eb-0775-4f36-8ba7-8e32d229265c",
      "title": "Training 2 title",
      "description": "training 2 description",
      "exercises": [
        {
          "id": "4da629eb-0775-4f36-8ba7-8e32d229265b",
          "title": "exercise1omg",
          "description": "super description omg",
          "sets": 3,
          "statistics": [
            {
              "load": {
                "repsAmount": 10, 
                "type": "repetition"
              }, 
              "date": "2025-01-22T14:46:08.600820"
            },
            {
              "load": {
                "repsAmount": 10, 
                "type": "repetition"
              }, 
              "date": "2025-02-22T14:46:08.600820"
            },
            {
              "load": {
                "repsAmount": 12, 
                "type": "repetition"
              }, 
              "date": "2025-03-30T14:46:08.600820"
            }
          ],
          "load": {
            "repsAmount": 15, 
            "type": "repetition"
          }
        },
        {
          "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
          "title": "exercise2omg",
          "description": null,
          "sets": 3,
          "statistics": [],
          "load": {
            "duration": 20000000, 
            "type": "timer"
          }
        },
        {
          "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
          "title": "exercise3omg",
          "description": "super description",
          "sets": 2,
          "statistics": [
            {
              "load": {
                "duration": 20000000,
                "type": "timer"
              }, 
              "date": "2025-01-22T14:46:08.600820"
            },
            {
              "load": {
                "duration": 20000000, 
                "type": "timer"
              }, 
              "date": "2025-02-22T14:46:08.600820"
            },
            {
              "load": {
                "duration": 25000000, 
                "type": "timer"
              }, 
              "date": "2025-03-30T14:46:08.600820"
            }
          ],
          "load": {
            "duration": 25000000,
            "type": "timer"
          }
        }
      ]
    }
  ],
  "meals": [
    {
      "id": "21a629eb-0775-4f36-8ba7-8e32d2292634",
      "title": "Test meal 1",
      "recipe": null,
      "ingredients": [] 
    },
    {
      "id": "12a629eb-0775-4f36-8ba7-8e32d2292621",
      "title": "Test meal 2",
      "recipe": "Test meal 2 recipe",
      "ingredients": [
        {
          "product": {
            "id": "a1a629eb-0775-4f36-8ba7-8e32d229261a",
            "name": "Product 1",
            "measurementUnit": "grams",
            "nutritionFacts": {
              "proteins": 10,
              "fats": 15,
              "carbohydrates": 20,
              "kilocalories": 300
            }
          },
          "amount": 200
        },
        {
          "product": {
            "id": "2aa629eb-0775-4f36-8ba7-8e32d22926a2",
            "name": "Product 2",
            "measurementUnit": "milliliters",
            "nutritionFacts": {
              "proteins": 11,
              "fats": 12,
              "carbohydrates": 21,
              "kilocalories": 250
            }
          },
          "amount": 100
        }
      ] 
    }
  ],
  "products": [
    {
      "id": "a1a629eb-0775-4f36-8ba7-8e32d229261a",
      "name": "Product 1",
      "measurementUnit": "grams",
      "nutritionFacts": 
        {
          "proteins": 10,
          "fats": 15,
          "carbohydrates": 20,
          "kilocalories": 300
        }
    },
    {
      "id": "2aa629eb-0775-4f36-8ba7-8e32d22926a2",
      "name": "Product 2",
      "measurementUnit": "milliliters",
      "nutritionFacts": 
        {
          "proteins": 11,
          "fats": 12,
          "carbohydrates": 21,
          "kilocalories": 250
        }
    }
  ]
}
''';

const nutritionFacts1 = NutritionFacts(
  proteins: 10,
  fats: 15,
  carbohydrates: 20,
  kilocalories: 300,
);

const nutritionFacts2 = NutritionFacts(
  proteins: 11,
  fats: 12,
  carbohydrates: 21,
  kilocalories: 250,
);

final product1 = Product.create(
  name: 'Product 1',
  measurementUnit: MeasurementUnit.grams,
  nutritionFacts: nutritionFacts1,
).copyWith(
  id: UuidValue.fromString('a1a629eb-0775-4f36-8ba7-8e32d229261a'),
);

final product2 = Product.create(
  name: 'Product 2',
  measurementUnit: MeasurementUnit.milliliters,
  nutritionFacts: nutritionFacts2,
).copyWith(
  id: UuidValue.fromString('2aa629eb-0775-4f36-8ba7-8e32d22926a2'),
);

void main() {
  group('User test: empty trainings, products and meals', () {
    late User user;

    setUp(() {
      user = User.create(weight: 80);

      user = user.copyWith(
        id: UuidValue.fromString('5ca629eb-0775-4f36-8ba7-8e32d22926be'),
      );
    });

    test("User's toJson()", () {
      final json = user.toJson();
      expect(json, equals(jsonDecode(user1Json)));
    });

    test("User's fromJson()", () {
      final parsedUser = User.fromJson(jsonDecode(user1Json));
      expect(user, equals(parsedUser));
    });
  });

  group('User test: filled trainings and meals', () {
    late User user;

    setUp(() {
      user = User.create(weight: 85);

      final trainings = getTrainings();
      final meals = getMeals();
      final products = getProducts();

      user = user.copyWith(
        id: UuidValue.fromString('43a629eb-0775-4f36-8ba7-8e32d2292611'),
        trainings: trainings,
        meals: meals,
        products: products,
      );
    });

    test("User's toJson()", () {
      final json = user.toJson();
      expect(json, equals(jsonDecode(user2Json)));
    });

    test("User's fromJson()", () {
      final parsedUser = User.fromJson(jsonDecode(user2Json));
      expect(user, equals(parsedUser));
    });
  });
}

List<Training> getTrainings() {
  var training1 = Training.create(
    title: 'Training 1 title',
    description: 'training 1 description',
  );

  var training2 = Training.create(
    title: 'Training 2 title',
    description: 'training 2 description',
  );

  final exercises = getExercises();

  final statistics1 = [
    ExerciseStatistic(
      load: const Repetition(repsAmount: 10),
      date: DateTime.parse('2025-01-22T14:46:08.600820'),
    ),
    ExerciseStatistic(
      load: const Repetition(repsAmount: 10),
      date: DateTime.parse('2025-02-22T14:46:08.600820'),
    ),
    ExerciseStatistic(
      load: const Repetition(repsAmount: 12),
      date: DateTime.parse('2025-03-30T14:46:08.600820'),
    ),
  ];

  final statistics2 = [
    ExerciseStatistic(
      load: const Timer(duration: Duration(seconds: 20)),
      date: DateTime.parse('2025-01-22T14:46:08.600820'),
    ),
    ExerciseStatistic(
      load: const Timer(duration: Duration(seconds: 20)),
      date: DateTime.parse('2025-02-22T14:46:08.600820'),
    ),
    ExerciseStatistic(
      load: const Timer(duration: Duration(seconds: 25)),
      date: DateTime.parse('2025-03-30T14:46:08.600820'),
    ),
  ];

  exercises
    ..first = exercises.first.copyWith(statistics: statistics1)
    ..last = exercises.last.copyWith(statistics: statistics2);

  training1 = training1.copyWith(
    exercises: exercises,
    id: UuidValue.fromString('a1a629eb-0775-4f36-8ba7-8e32d229265c'),
  );

  training2 = training2.copyWith(
    exercises: exercises,
    id: UuidValue.fromString('22a629eb-0775-4f36-8ba7-8e32d229265c'),
  );

  return [training1, training2];
}

List<Meal> getMeals() {
  var meal1 = Meal.create(title: 'Test meal 1', recipe: null);
  var meal2 = Meal.create(title: 'Test meal 2', recipe: 'Test meal 2 recipe');

  final ingredient1 = Ingredient(
    product: product1,
    amount: 200,
  );

  final ingredient2 = Ingredient(
    product: product2,
    amount: 100,
  );

  meal1 = meal1.copyWith(
    id: UuidValue.fromString('21a629eb-0775-4f36-8ba7-8e32d2292634'),
  );

  meal2 = meal2.copyWith(
    id: UuidValue.fromString('12a629eb-0775-4f36-8ba7-8e32d2292621'),
    ingredients: [ingredient1, ingredient2],
  );

  return [meal1, meal2];
}

List<Exercise> getExercises() => [
      Exercise(
        title: 'exercise1omg',
        description: 'super description omg',
        sets: 3,
        load: const Repetition(repsAmount: 15),
        statistics: [],
      ).copyWith(
        id: UuidValue.fromString('4da629eb-0775-4f36-8ba7-8e32d229265b'),
      ),
      Exercise(
        title: 'exercise2omg',
        description: null,
        sets: 3,
        load: const Timer(duration: Duration(seconds: 20)),
        statistics: [],
      ).copyWith(
        id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
      ),
      Exercise(
        title: 'exercise3omg',
        description: 'super description',
        sets: 2,
        load: const Timer(duration: Duration(seconds: 25)),
        statistics: [],
      ).copyWith(
        id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
      ),
    ];

List<Product> getProducts() => [product1, product2];
