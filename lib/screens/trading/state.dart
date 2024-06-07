import 'dart:math';

import 'package:riverpod/riverpod.dart';

import '../../api/api.dart';
import '../../api/codes.dart';

DateTime getRandomDate() {
  DateTime begin = DateTime(2015, 1, 1);
  DateTime end = DateTime(2024, 1, 1);

  final random = Random();
  final days = end.difference(begin).inDays;
  return begin.add(Duration(days: random.nextInt(days)));
}

class DateRange {
  late DateTime begin, end;

  DateRange(this.begin, this.end);

  DateRange.random() {
    begin = getRandomDate();
    end = begin.add(const Duration(days: 180));
  }
}

final trainDataFutureProvider = FutureProvider.autoDispose<TrainData>((ref) {
  var code = getRandomStockCode();
  var dateRange = DateRange.random();
  return getTrainData(code, dateRange.begin, end: dateRange.end);
});
