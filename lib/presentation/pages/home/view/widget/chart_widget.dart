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
    // updatePoints();
    getFilteredPoints();
  }

  void updatePoints() async {
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();
    // db.updateAllTotalAmountHistory();

    print(widget.timePeriod);
    const List<FlSpot> tempPoints = [
      FlSpot(0, 0),
      FlSpot(1, 0),
    ];

    setState(() {
      points = tempPoints;
    });
    // print(points.length);
  }

  List<FlSpot> getFilteredPoints() {
    print("getFilteredPoints");
    DateTime now = DateTime.now();
    DateTime startDate = now.subtract(const Duration(days: 7));
    CryptoDBRepositoryImpl db = context.read<CryptoDBRepositoryImpl>();

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
        if (db.state.totalAmountHistoryList.length >= 2) {
          return db.state.totalAmountHistoryList
              .map((dataPoint) => FlSpot(
                  dataPoint.createdAt.millisecondsSinceEpoch.toDouble(),
                  dataPoint.totalAmount))
              .toList();
        }
    }

    final List<FlSpot> totalAmountHistory = db.state.totalAmountHistoryList
        .where((dataPoint) => dataPoint.createdAt.isAfter(startDate))
        .map((dataPoint) => FlSpot(
            dataPoint.createdAt.millisecondsSinceEpoch.toDouble(),
            dataPoint.totalAmount))
        .toList();

    if (totalAmountHistory.isEmpty &&
        db.state.totalAmountHistoryList.isNotEmpty) {
      totalAmountHistory.add(FlSpot(
          db.state.totalAmountHistoryList.last.createdAt.millisecondsSinceEpoch
              .toDouble(),
          db.state.totalAmountHistoryList.last.totalAmount));
    }
    if (totalAmountHistory.length == 1 &&
        db.state.totalAmountHistoryList.isNotEmpty) {
      totalAmountHistory.add(FlSpot(now.millisecondsSinceEpoch.toDouble(),
          db.state.totalAmountHistoryList.last.totalAmount));
    }
    if (totalAmountHistory.isEmpty) {
      totalAmountHistory.add(const FlSpot(0, 0));
      totalAmountHistory.add(const FlSpot(1, 0));
    }
    setState(() {
      points = totalAmountHistory;
    });
    return totalAmountHistory;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryptoDBRepositoryImpl, CryptoDBRepositoryState>(
      listener: (context, state) {
        getFilteredPoints();
      },
      builder: (context, state) {
        return Container(
          height: 92.h,
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: points,
                  isCurved: true,
                  barWidth: 2,
                  color: Theme.of(context).colorScheme.onSurface,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, bar, index) {
                      if (index == points.length - 1) {
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
                        '\$${touchedSpot.y.toStringAsFixed(2)}',
                        const TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                  fitInsideHorizontally: true,
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
