import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';

class CandleChartWidget extends StatelessWidget {
  const CandleChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveChart(candles: const []);
  }
}
