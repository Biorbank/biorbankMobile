import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});
  static const List<FlSpot> points = [
    FlSpot(
      1,
      2,
    ),
    FlSpot(
      2,
      2.6,
    ),
    FlSpot(
      4,
      5,
    ),
    FlSpot(
      5,
      3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92.h,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: points,
              isCurved: true,
              barWidth: 2,
              color: Theme.of(context).colorScheme.onSurface,
              dotData:  FlDotData(
                show: true, 
                getDotPainter: (spot, percent, bar, index) {
                   if (index == 2) { 
                      return FlDotCirclePainter(
                        radius: 8,
                        color: Theme.of(context).colorScheme.onPrimary,
                        strokeWidth: 3,
                        strokeColor: Theme.of(context).colorScheme.onSurface,
                      );
                    }
                    return FlDotCirclePainter(color: Colors.transparent);
                },
              ),
              belowBarData: BarAreaData(
                show: true, // Hide the area below the line
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                    Theme.of(context).colorScheme.onSurface.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          showingTooltipIndicators: [
            ShowingTooltipIndicators([
              LineBarSpot(
                LineChartBarData(
                  color: Theme.of(context).colorScheme.shadow,
                    dotData: const FlDotData(
                  show: true,
                )),
                2,
                const FlSpot(
                  2,
                  3,
                ),
              )
            ])
          ], 
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((touchedSpot) {
                  return LineTooltipItem(
                    '\$${touchedSpot.y.toStringAsFixed(0)}',
                    const TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
          ),
          gridData: const FlGridData(
            show: false, // Hide grid lines
          ),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(drawBelowEverything: false),
            bottomTitles: AxisTitles(drawBelowEverything: false),
            topTitles: AxisTitles(drawBelowEverything: false),
            rightTitles: AxisTitles(drawBelowEverything: false),
          ),
          borderData: FlBorderData(
            show: false, // Hide border
          ),
        ),
      ),
    );
  }
}
