import 'dart:math';

import 'package:interactive_chart/interactive_chart.dart';

class MockDataTesla {
  static List<CandleData> candleData = List.generate(15, (index) {
    Random random = Random();
    int day = 1 + index;
    int month = 6;

    double open = 2000 + random.nextDouble() * 7;
    double high = open + random.nextDouble() * 12;
    double low = open - random.nextDouble() * 5;
    double close = open + random.nextDouble() * 10 - 5;

    return CandleData(
      open: open,
      high: high,
      low: low,
      close: close,
      timestamp: DateTime(month, day).millisecondsSinceEpoch,
      volume: 0,
    );
  });
}
