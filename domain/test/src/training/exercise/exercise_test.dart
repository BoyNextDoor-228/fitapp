import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

const exercise1Json = '''
{
  "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
  "title": "exercise1omg",
  "description": null,
  "sets": 3,
  "statistics": [],
  "load": {
    "duration": 20000000, 
    "type": "timer"
  }
}''';

const exercise2Json = '''
{
  "id": "2da629eb-0775-4f36-8ba7-8e32d229264a",
  "title": "exercise2omg",
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

const exercise3Json = '''
{
  "id": "4da629eb-0775-4f36-8ba7-8e32d229265b",
  "title": "exercise3omg",
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

const emptyRepsExerciseJson = '''
{
  "id": "111629eb-0775-4f36-8ba7-8e32d2292111",
  "title": "emptyRepsExercise",
  "description": "super description omg",
  "sets": 0,
  "statistics": [],
  "load": {
    "repsAmount": 0, 
    "type": "repetition"
  }
}''';

const emptyTimerExerciseJson = '''
{
  "id": "222629eb-0775-4f36-8ba7-8e32d2292222",
  "title": "emptyTimerExercise",
  "description": "super description omg",
  "sets": 0,
  "statistics": [],
  "load": {
    "duration": 0, 
    "type": "timer"
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
  group('Exercise test: Exercise 1 - empty stats', () {
    late AbstractExercise abstractExercise;
    late Exercise exercise;

    setUp(() {
      abstractExercise = AbstractExercise.withTimer(
        title: 'exercise1omg',
        description: null,
      );

      exercise = Exercise.fromAbstractWithTimer(
        abstractExercise: abstractExercise,
        setsAmount: 3,
        duration: const Duration(seconds: 20),
      );

      exercise = exercise.copyWith(
        id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
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

  group('Exercise test: Exercise 2 - stats with timer', () {
    late AbstractExercise abstractExercise;
    late Exercise exercise;

    setUp(() {
      abstractExercise = AbstractExercise.withTimer(
        title: 'exercise2omg',
        description: 'super description',
      );

      exercise = Exercise.fromAbstractWithTimer(
        abstractExercise: abstractExercise,
        duration: const Duration(seconds: 25),
        setsAmount: 2,
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
      expect(json, equals(jsonDecode(exercise2Json)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise = Exercise.fromJson(jsonDecode(exercise2Json));
      expect(exercise, equals(parsedExercise));
    });
  });

  group('Exercise test: Exercise 3- stats with reps', () {
    late AbstractExercise abstractExercise;
    late Exercise exercise;

    setUp(() {
      abstractExercise = AbstractExercise.withReps(
        title: 'exercise3omg',
        description: 'super description omg',
      );

      exercise = Exercise.fromAbstractWithReps(
        abstractExercise: abstractExercise,
        setsAmount: 3,
        repsAmount: 15,
      );

      exercise = exercise.copyWith(
        id: UuidValue.fromString('4da629eb-0775-4f36-8ba7-8e32d229265b'),
        statistics: statistics,
      );
    });

    test("Exercise's toJson()", () {
      final json = exercise.toJson();
      expect(json, equals(jsonDecode(exercise3Json)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise = Exercise.fromJson(jsonDecode(exercise3Json));
      expect(exercise, equals(parsedExercise));
    });
  });

  group('Exercise test: Default Exercise with Timer', () {
    late Exercise exercise;

    setUp(() {
      exercise = Exercise(
        title: 'exercise1omg',
        description: null,
        sets: 3,
        statistics: [],
        load: const Timer(duration: Duration(seconds: 20)),
      );

      exercise = exercise.copyWith(
        id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
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

  group('Exercise test: Default Exercise with Reps', () {
    late Exercise exercise;

    setUp(() {
      exercise = Exercise(
        title: 'exercise3omg',
        description: 'super description omg',
        sets: 3,
        statistics: statistics,
        load: const Repetition(repsAmount: 15),
      );

      exercise = exercise.copyWith(
        id: UuidValue.fromString('4da629eb-0775-4f36-8ba7-8e32d229265b'),
      );
    });

    test("Exercise's toJson()", () {
      final json = exercise.toJson();
      expect(json, equals(jsonDecode(exercise3Json)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise = Exercise.fromJson(jsonDecode(exercise3Json));
      expect(exercise, equals(parsedExercise));
    });
  });

  group('Exercise test: Empty Reps Exercise', () {
    late AbstractExercise abstractExercise;
    late Exercise exercise;

    setUp(() {
      abstractExercise = AbstractExercise.withReps(
        title: 'emptyRepsExercise',
        description: 'super description omg',
      );

      exercise = Exercise.emptyFromAbstract(
        abstractExercise: abstractExercise,
      );

      exercise = exercise.copyWith(
        id: UuidValue.fromString('111629eb-0775-4f36-8ba7-8e32d2292111'),
      );
    });

    test("Exercise's toJson()", () {
      final json = exercise.toJson();
      expect(json, equals(jsonDecode(emptyRepsExerciseJson)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise =
          Exercise.fromJson(jsonDecode(emptyRepsExerciseJson));
      expect(exercise, equals(parsedExercise));
    });
  });

  group('Exercise test: Empty Timers Exercise', () {
    late AbstractExercise abstractExercise;
    late Exercise exercise;

    setUp(() {
      abstractExercise = AbstractExercise.withTimer(
        title: 'emptyTimerExercise',
        description: 'super description omg',
      );

      exercise = Exercise.emptyFromAbstract(
        abstractExercise: abstractExercise,
      );

      exercise = exercise.copyWith(
        id: UuidValue.fromString('222629eb-0775-4f36-8ba7-8e32d2292222'),
      );
    });

    test("Exercise's toJson()", () {
      final json = exercise.toJson();
      expect(json, equals(jsonDecode(emptyTimerExerciseJson)));
    });

    test("Exercise's fromJson()", () {
      final parsedExercise =
          Exercise.fromJson(jsonDecode(emptyTimerExerciseJson));
      expect(exercise, equals(parsedExercise));
    });
  });
}
