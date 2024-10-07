import 'package:biorbank/utils/repositories/crypto_db_repository/crypto_db_repository_impl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartWidget extends StatefulWidget {
  final String timePeriod;
  const ChartWidget({
    super.key,
    required this.timePeriod,
  });

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<FlSpot> points = [];

  @override
  void initState() {
    super.initState();

    print(widget.timePeriod);
    const List<FlSpot> tempPoints = [
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

    setState(() {
      points = tempPoints;
    });
    updatePoints();
  }

  void updatePoints() async {
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    // db.updateAllTotalAmountHistory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoDBRepositoryImpl, CryptoDBRepositoryState>(
      builder: (context, state) {
        List<FlSpot> getFilteredPoints() {
          print("getFilteredPoints");
          DateTime now = DateTime.now();
          DateTime startDate;

          switch (widget.timePeriod) {
            case "1W":
              startDate = now.subtract(const Duration(days: 7));
              break;
            case "MTD":
              startDate = DateTime(now.year, now.month, 1);
              break;
            case "1M":
              startDate = now.subtract(const Duration(days: 30));
              break;
            case "YTD":
              startDate = DateTime(now.year, 1, 1);
              break;
            case "1Y":
              startDate = now.subtract(const Duration(days: 365));
              break;
            case "ALL":
            default:
              return state.totalAmountHistoryList
                  .map((dataPoint) => FlSpot(
                      dataPoint.createdAt.millisecondsSinceEpoch.toDouble(),
                      dataPoint.totalAmount))
                  .toList();
          }

          final List<FlSpot> totalAmountHistory = state.totalAmountHistoryList
              .where((dataPoint) => dataPoint.createdAt.isAfter(startDate))
              .map((dataPoint) => FlSpot(
                  dataPoint.createdAt.millisecondsSinceEpoch.toDouble(),
                  dataPoint.totalAmount))
              .toList();

          if (totalAmountHistory.isEmpty &&
              state.totalAmountHistoryList.isNotEmpty) {
            totalAmountHistory.add(FlSpot(
                state.totalAmountHistoryList.last.createdAt
                    .millisecondsSinceEpoch
                    .toDouble(),
                state.totalAmountHistoryList.last.totalAmount));
          }
          if (totalAmountHistory.length == 1 &&
              state.totalAmountHistoryList.isNotEmpty) {
            totalAmountHistory.add(FlSpot(now.millisecondsSinceEpoch.toDouble(),
                state.totalAmountHistoryList.last.totalAmount));
          }
          if (totalAmountHistory.isEmpty) {
            totalAmountHistory.add(const FlSpot(0, 0));
            totalAmountHistory.add(const FlSpot(1, 0));
          }
          return totalAmountHistory;
        }

        return SizedBox(
          height: 92.h,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: getFilteredPoints(),
                  isCurved: true,
                  barWidth: 2,
                  color: Theme.of(context).colorScheme.onSurface,
                  dotData: FlDotData(
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
                        Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.15),
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
      },
    );
  }
}
