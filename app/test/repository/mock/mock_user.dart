import 'package:fitapp_domain/domain.dart';
import 'package:uuid/uuid.dart';

import 'mock_products.dart';

User mockUser = User.create(weight: 100).copyWith(
  id: UuidValue.fromString('111b3518-ede2-11ef-8300-a3504b8d5000'),
  meals: mockMeals,
  trainings: mockTrainings,
);

final mockMeals = List.generate(
  3,
  (int index) => Meal.create(
    title: 'Meal №$index',
    recipe: index.isEven ? null : 'Meal №$index superduper description',
  ).copyWith(
    ingredients: mockIngredients,
    id: UuidValue.fromString('aaab3518-ede2-11ef-8300-a3504b8d5111'),
  ),
);

final mockIngredients = List.generate(
  2,
  (int index) => Ingredient(
    product: mockProducts[index],
    amount: 200,
  ),
);

final mockTrainings = List.generate(
  3,
  (int index) => Training.create(
    title: 'Training №$index',
    description:
        index.isEven ? null : 'Training №$index superduper description',
  ).copyWith(
    id: UuidValue.fromString('222b3518-ede2-11ef-8300-a3504b8d5eee'),
    exercises: mockExercises,
  ),
);

final mockExercises = List.generate(
  2,
  (int index) => Exercise(
    title: 'Exercise 1 title',
    description: null,
    sets: 2,
    load: const Repetition(repsAmount: 10),
    statistics: mockExerciseStatistics,
  ).copyWith(
    id: UuidValue.fromString('33b3518-ede2-11ef-8300-a3504b8d5aa$index'),
  ),
);

final mockExerciseStatistics = [
  ExerciseStatistic(
    load: const Repetition(repsAmount: 10),
    date: DateTime(2025, 1, 1, 1, 1, 1, 1, 1),
  ),
  ExerciseStatistic(
    load: const Repetition(repsAmount: 12),
    date: DateTime(2025, 2, 1, 1, 1, 1, 1, 1),
  ),
];
