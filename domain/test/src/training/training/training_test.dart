import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid_value.dart';

const training1Json = '''
{
  "id": "a1a629eb-0775-4f36-8ba7-8e32d229265c",
  "title": "Training 1 title",
  "description": null,
  "exercises": []
}
''';

const training2Json = '''
{
  "id": "a1a629eb-0775-4f36-8ba7-8e32d229265c",
  "title": "Training 2 title",
  "description": "training 2 description",
  "exercises": [
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
    },
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
    },
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
    }
  ]
}
''';

void main() {
  group('Training test: Training 1 - empty exercises', () {
    late Training training;

    setUp(() {
      training = Training.create(
        title: 'Training 1 title',
        description: null,
      );

      training = training.copyWith(
        id: UuidValue.fromString('a1a629eb-0775-4f36-8ba7-8e32d229265c'),
      );
    });

    test("Training's toJson()", () {
      final json = training.toJson();
      expect(json, equals(jsonDecode(training1Json)));
    });

    test("Training's fromJson()", () {
      final parsedTraining = Training.fromJson(jsonDecode(training1Json));
      expect(training, equals(parsedTraining));
    });
  });

  group('Training test: Training 2 - different exercises are included', () {
    late Training training;

    setUp(() {
      training = Training.create(
        title: 'Training 2 title',
        description: 'training 2 description',
      );

      final exercises = [
        Exercise.fromAbstractWithReps(
          setsAmount: 3,
          repsAmount: 15,
          abstractExercise: AbstractExercise.withReps(
            title: 'exercise3omg',
            description: 'super description omg',
          ),
        ).copyWith(
          id: UuidValue.fromString('4da629eb-0775-4f36-8ba7-8e32d229265b'),
        ),
        Exercise.fromAbstractWithTimer(
          setsAmount: 3,
          duration: const Duration(seconds: 20),
          abstractExercise: AbstractExercise.withTimer(
            title: 'exercise1omg',
            description: null,
          ),
        ).copyWith(
          id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
        ),
        Exercise.fromAbstractWithTimer(
          setsAmount: 2,
          duration: const Duration(seconds: 25),
          abstractExercise: AbstractExercise.withTimer(
            title: 'exercise2omg',
            description: 'super description',
          ),
        ).copyWith(
          id: UuidValue.fromString('2da629eb-0775-4f36-8ba7-8e32d229264a'),
        ),
      ];

      final statistics3 = [
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
        ..first = exercises.first.copyWith(statistics: statistics3)
        ..last = exercises.last.copyWith(statistics: statistics2);

      training = training.copyWith(
        exercises: exercises,
        id: UuidValue.fromString('a1a629eb-0775-4f36-8ba7-8e32d229265c'),
      );
    });

    test("training's toJson()", () {
      final json = training.toJson();
      expect(json, equals(jsonDecode(training2Json)));
    });

    test("Training's fromJson()", () {
      final parsedTraining = Training.fromJson(jsonDecode(training2Json));
      expect(training, equals(parsedTraining));
    });
  });
}
