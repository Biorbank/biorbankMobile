import 'package:biorbank/presentation/common/custom_dropdown_widget.dart';
import 'package:biorbank/utils/app_widgets.dart';
import 'package:biorbank/utils/common_spacer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceLineChart extends StatelessWidget {
  const PriceLineChart({
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
                    child: AppConstant.commonText('All time', fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.shadow),
                  )
                ],
                onChanged: (value) {},
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
          height(15.h),
          SizedBox(
            height: 200.h,
            child: LineChart(
              LineChartData(
                minX: 0.8,
                minY: 0,
                maxX: 6,
                maxY: 20,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    interval: 4,
                    getTitlesWidget: (value, meta) {
                      return AppConstant.commonText(value.toInt().toString(),
                          fontSize: 12.sp,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer);
                    },
                  )),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      String text = '';
                      switch (value.toInt()) {
                        case 1:
                          text = '12/14';
                          break;
                        case 2:
                          text = '05/08';
                          break;
                        case 3:
                          text = '09/30';
                          break;

                        case 4:
                          text = '02/22';
                          break;
                        case 5:
                          text = '07/24';
                        case 6:
                          text = '03/23';
                          break;
                      }
                      return AppConstant.commonText(text,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          fontSize: 12.sp);
                    },
                  )),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(1, 8),
                      const FlSpot(2, 12.4),
                      const FlSpot(3, 10.8),
                      const FlSpot(4, 9),
                      const FlSpot(5, 8),
                      const FlSpot(6, 8.6),
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
                    getTooltipColor: (touchedSpot) {
                      return Theme.of(context).colorScheme.shadow;
                    },
                    fitInsideHorizontally: true,
                    tooltipRoundedRadius: 6.0,
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((LineBarSpot touchedSpot) {
                        return LineTooltipItem(
                            '${touchedSpot.x}, ${touchedSpot.y}',
                            textAlign: TextAlign.left,
                             TextStyle(color: Theme.of(context).colorScheme.onSurface),
                            children: [
                              TextSpan(
                                  text: '\nAvg. price',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer)),
                              TextSpan(
                                  text: '  0.049',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface)),
                              TextSpan(
                                  text: '\nVolume',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer)),
                              TextSpan(
                                  text: '  0.049',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface)),
                              TextSpan(
                                  text: '\nNum of sale',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondaryContainer)),
                              TextSpan(
                                  text: '  1',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface)),
                            ]);
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
