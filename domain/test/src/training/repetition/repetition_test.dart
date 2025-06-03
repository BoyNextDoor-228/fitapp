import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';

const repetitionJson = '''
{
  "type": "repetition",
  "repsAmount": 10
}
''';

void main() {
  group('Exercise load test: Repetition', () {
    late Repetition repetition;

    setUp(() {
      repetition = const Repetition(repsAmount: 10);
    });

    test("Repetition's toJson()", () {
      final json = repetition.toJson();
      expect(json, equals(jsonDecode(repetitionJson)));
    });

    test("Repetition's fromJson()", () {
      final parsedRepetition = Repetition.fromJson(jsonDecode(repetitionJson));
      expect(repetition, equals(parsedRepetition));
    });
  });
}
