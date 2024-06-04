import 'package:biorbank/utils/app_widgets.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverViewLineChart extends StatelessWidget {
  const OverViewLineChart(
      {super.key,
      this.isShowDot = false,
      this.isShowBottomSideData = false,
      this.isShowRightSideData = false});
  final bool isShowDot;
  final bool isShowBottomSideData;
  final bool isShowRightSideData;
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        baselineX: 0,
        gridData:  FlGridData(show: true, drawVerticalLine: false,drawHorizontalLine: isShowDot),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles( 
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return isShowBottomSideData? AppConstant.commonText(value.toStringAsFixed(2),
                    fontSize: 11.sp,
                    color:
                        Theme.of(context).colorScheme.onSecondaryContainer):const SizedBox.shrink();
              },
            ),
          ),
          leftTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 0.1,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return isShowRightSideData? AppConstant.commonText('${value.toStringAsFixed(1)}T',
                    fontSize: 11.sp,
                    color:
                        Theme.of(context).colorScheme.onSecondaryContainer):const SizedBox.shrink();
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, bar, index) {
                if (index == 2&&isShowDot) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Theme.of(context).colorScheme.onPrimary,
                    strokeWidth: 3,
                    strokeColor: Theme.of(context).colorScheme.onSurface,
                  );
                }
                return FlDotCirclePainter(color: Colors.transparent);
              },
            ),
            spots: [
              const FlSpot(1, 3.2),
              const FlSpot(2, 3.3),
              const FlSpot(3, 3.4),
              const FlSpot(5, 3.3),
            ],
            isCurved: true,
            color: Theme.of(context).colorScheme.onPrimary,
            barWidth: 2,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF2D309B).withOpacity(0.16),
                    const Color(0xFF306BFF).withOpacity(0.01),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
