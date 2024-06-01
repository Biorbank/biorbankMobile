import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceHistoryChart extends StatelessWidget {
  const PriceHistoryChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                //  flex: 2,
                child: AppConstant.commonText('Price history',
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.shadow),
              ),
              CommonDropdownWidget(
                value: 'All time',
                textStyle:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                backGroundColor: const Color(0xFFF2F2F2),
                labelText: '',
                items: [
                  DropdownMenuItem(
                    value: 'All time',
                    child: AppConstant.commonText('All time',
                        color: Theme.of(context).colorScheme.shadow),
                  )
                ],
                onChanged: (p0) {},
              )
            ],
          ),
          Row(
            children: [
              AppConstant.commonText('All-time avg price',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
              width(14.w),
              CachedNetworkImage(
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png',
                height: 20.h,
                width: 20.w,
                placeholder: (context, url) => const SizedBox.shrink(),
              ),
              width(10.w),
              AppConstant.commonText('0.8065',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.shadow),
            ],
          ),
          SizedBox(
            height: 200.h,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 5,
                minY: 0,
                maxY: 2,
                titlesData: const FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  bottomTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 0.5,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 0.5),
                      const FlSpot(1, 0.8),
                      const FlSpot(2, 1.6),
                      const FlSpot(3, 1.2),
                      const FlSpot(4, 0.9),
                      const FlSpot(5, 0.8),
                    ],
                    isCurved: true,
                    color: Theme.of(context).colorScheme.onPrimary,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, bar, index) {
                        if (index == 2) {
                          return FlDotCirclePainter(
                            radius: 8,
                            color: Theme.of(context).colorScheme.onPrimary,
                            strokeWidth: 3,
                            strokeColor:
                                Theme.of(context).colorScheme.onSurface,
                          );
                        }
                        return FlDotCirclePainter(color: Colors.transparent);
                      },
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    //  tooltipBgColor: Colors.black,
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((LineBarSpot touchedSpot) {
                        return LineTooltipItem(
                          '${touchedSpot.x}, ${touchedSpot.y}',
                          const TextStyle(color: Colors.white),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
