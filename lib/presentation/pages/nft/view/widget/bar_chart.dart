import 'package:biorbank/utils/app_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarChartSample extends StatelessWidget {
  const BarChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 3,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                switch (value.toInt()) {
                  case 0:
                    return SideTitleWidget(
                      space: 10,
                      axisSide: meta.axisSide,
                      child: AppConstant.commonText('Dec 19',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    );
                  case 10:
                    return SideTitleWidget(
                      space: 10,
                      axisSide: meta.axisSide,
                      child: AppConstant.commonText('Jan 23',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    );
                  case 20:
                    return SideTitleWidget(
                      space: 10,
                      axisSide: meta.axisSide,
                      child: AppConstant.commonText('FEB 14',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    );
                  case 30:
                    return SideTitleWidget(
                      space: 10,
                      axisSide: meta.axisSide,
                      child: AppConstant.commonText('March 8',
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
              reservedSize: 28,
            ),
          ),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: AppConstant.commonText(value.toInt().toString(),
                      fontSize: 12.sp,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: _generateBarGroups(context: context),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 1,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
                color: Theme.of(context).colorScheme.onSecondaryFixed,
                strokeWidth: 1);
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups({required BuildContext context}) {
    final List<double> values = [
      1,
      1.3,
      1,
      0.5,
      0.4,
      1,
      0.5,
      0.5,
      1.3,
      0.5,
      1,
      0.3,
      1,
      0.2,
      1,
      0.7,
      1,
      2,
      0.5,
      1,
      0.5,
      2.5,
      3,
      2,
      1.5,
      1.2,
      1,
      0.5,
      1,
      0.5,
      1.5,
      1.5,
      1.4,
      1,
      0.5,
      1.2,
      0.2,
      0.5,
    ];

    return values.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
              toY: entry.value,
              color: Theme.of(context).colorScheme.onPrimary,
              width: 5,
              borderRadius: BorderRadius.zero),
        ],
      );
    }).toList();
  }
}
