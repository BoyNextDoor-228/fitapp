import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

const exercise1Json = '''
{
  "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
  "title": "exercise1omg",
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
}''';

const exercise2Json = '''
{
  "id": "4da629eb-0775-4f36-8ba7-8e32d229265b",
  "title": "exercise2omg",
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
}''';

const emptyExerciseJson = '''
{
  "id": "111629eb-0775-4f36-8ba7-8e32d2292111",
  "title": "",
  "description": null,
  "sets": 0,
  "statistics": [],
  "load": {
    "repsAmount": 0, 
    "type": "repetition"
  }
}''';

final statistics = [
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

void main() {
  group('Exercise test: Empty Exercise', () {
    late Exercise exercise;

    setUp(() {
      exercise = Exercise.empty();

      exercise = exercise.copyWith(
        id: UuidValue.fromString('111629eb-0775-4f36-8ba7-8e32d2292111'),
      );
    });

    test("Exercise's toJson()", () {
      final json = exercise.toJson();
      expect(json, equals(jsonDecode(emptyExerciseJson)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise = Exercise.fromJson(jsonDecode(emptyExerciseJson));
      expect(exercise, equals(parsedExercise));
    });
  });

  group('Exercise test: Exercise 1 - stats with timer', () {
    late Exercise exercise;

    setUp(() {
      exercise = Exercise(
        title: 'exercise1omg',
        description: 'super description',
        sets: 2,
        load: const Timer(duration: Duration(seconds: 25)),
        statistics: [],
      );

      final statistics = [
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

      exercise = exercise.copyWith(
        id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
        statistics: statistics,
      );
    });

    test("Exercise's toJson()", () {
      final json = exercise.toJson();
      expect(json, equals(jsonDecode(exercise1Json)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise = Exercise.fromJson(jsonDecode(exercise1Json));
      expect(exercise, equals(parsedExercise));
    });
  });

  group('Exercise test: Exercise 2- stats with reps', () {
    late Exercise exercise;

    setUp(() {
      exercise = Exercise(
        title: 'exercise2omg',
        description: 'super description omg',
        sets: 3,
        load: const Repetition(repsAmount: 15),
        statistics: statistics,
      );

      exercise = exercise.copyWith(
        id: UuidValue.fromString('4da629eb-0775-4f36-8ba7-8e32d229265b'),
      );
    });

    test("Exercise's toJson()", () {
      final json = exercise.toJson();
      expect(json, equals(jsonDecode(exercise2Json)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise = Exercise.fromJson(jsonDecode(exercise2Json));
      expect(exercise, equals(parsedExercise));
    });
  });
}
