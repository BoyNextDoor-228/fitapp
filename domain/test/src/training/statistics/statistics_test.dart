import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';

const statsWithTimerJson = '''
{
  "load": {
    "duration": 20000000,
    "type": "timer"
  }, 
  "date": "2025-01-22T14:46:08.600820"
}''';

const statsWithRepsJson = '''
{
  "load": {
    "repsAmount": 12, 
    "type": "repetition"
  }, 
  "date": "2025-01-22T14:46:08.600820"
}''';

void main() {
  group('Statistics test: Timer', () {
    late ExerciseStatistic stats;

    setUp(() {
      const timer = Timer(duration: Duration(seconds: 20));
      final date = DateTime.parse('2025-01-22T14:46:08.600820');

      stats = ExerciseStatistic(load: timer, date: date);
    });

    test("Statistics' toJson()", () {
      final json = stats.toJson();
      expect(json, equals(jsonDecode(statsWithTimerJson)));
    });

    test("Statistics' fromJson()", () {
      final parsedStats =
          ExerciseStatistic.fromJson(jsonDecode(statsWithTimerJson));
      expect(stats, equals(parsedStats));
    });
  });

  group('Statistics test: Repetitions', () {
    late ExerciseStatistic stats;

    setUp(() {
      const reps = Repetition(repsAmount: 12);
      final date = DateTime.parse('2025-01-22T14:46:08.600820');

      stats = ExerciseStatistic(load: reps, date: date);
    });

    test("Statistics' toJson()", () {
      final json = stats.toJson();
      expect(json, equals(jsonDecode(statsWithRepsJson)));
    });

    test("Statistics' fromJson()", () {
      final parsedStats =
          ExerciseStatistic.fromJson(jsonDecode(statsWithRepsJson));
      expect(stats, equals(parsedStats));
    });
  });
}
