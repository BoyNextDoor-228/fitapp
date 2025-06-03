import 'dart:convert';

import 'package:fitapp_domain/domain.dart';
import 'package:test/test.dart';

const timerJson = '''
{
  "type": "timer",
  "duration": 20000000
}
''';

void main() {
  group('Exercise load test: Timer', () {
    late Timer timer;

    setUp(() {
      timer = const Timer(duration: Duration(seconds: 20));
    });

    test("Timer's toJson()", () {
      final json = timer.toJson();
      expect(json, equals(jsonDecode(timerJson)));
    });

    test("Timer's fromJson()", () {
      final parsedTimer = Timer.fromJson(jsonDecode(timerJson));
      expect(timer, equals(parsedTimer));
    });
  });
}
