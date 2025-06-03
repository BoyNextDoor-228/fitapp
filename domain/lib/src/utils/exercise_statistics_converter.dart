import 'package:json_annotation/json_annotation.dart';

import '../training/statistics/exercise_statistic.dart';

typedef Statistics = List<ExerciseStatistic>;

class ExerciseStatisticsConverter
    implements JsonConverter<Statistics, Map<String, dynamic>> {
  const ExerciseStatisticsConverter();

  @override
  Statistics fromJson(Map<String, dynamic> json) {
    final jsonList = json['statistics'] as List<Map<String, dynamic>>;

    return jsonList.map(ExerciseStatistic.fromJson).toList();
  }

  @override
  Map<String, dynamic> toJson(Statistics statistics) {
    final jsonList = statistics.map((statistic) => statistic.toJson()).toList();

    return {'statistics': jsonList};
  }
}
