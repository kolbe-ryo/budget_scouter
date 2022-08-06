// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../model/money_consumption_history_model.dart';
import '../page/money_meter_page.dart';

class MoneyHistoryChart extends ConsumerWidget {
  const MoneyHistoryChart(this.year, {Key? key}) : super(key: key);

  final int year;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyList = ref
        .watch(moneyMeterProvider.select((state) => state.moneyMeterModel.moneyConsumptionHistoryModelList))
        .where((element) => element.year == year)
        .toList();
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData(historyList),
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 5000,
        minY: -5000,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipMargin: 4,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              kTextStyleHint,
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta, List<MoneyConsumptionHistoryModel> histories) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(
        histories[value.toInt()].month.toString(),
        style: kTextStyleSecondary,
      ),
    );
  }

  FlTitlesData titlesData(List<MoneyConsumptionHistoryModel> histories) {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) => getTitles(value, meta, histories),
        ),
      ),
      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  final _barsGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: -4,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        // BarChartGroupData(
        //   x: 2,
        //   barRods: [
        //     BarChartRodData(
        //       toY: 14,
        //       gradient: _barsGradient,
        //     )
        //   ],
        //   showingTooltipIndicators: [0],
        // ),
        // BarChartGroupData(
        //   x: 3,
        //   barRods: [
        //     BarChartRodData(
        //       toY: 15,
        //       gradient: _barsGradient,
        //     )
        //   ],
        //   showingTooltipIndicators: [0],
        // ),
        // BarChartGroupData(
        //   x: 4,
        //   barRods: [
        //     BarChartRodData(
        //       toY: 13,
        //       gradient: _barsGradient,
        //     )
        //   ],
        //   showingTooltipIndicators: [0],
        // ),
        // BarChartGroupData(
        //   x: 5,
        //   barRods: [
        //     BarChartRodData(
        //       toY: 10,
        //       gradient: _barsGradient,
        //     )
        //   ],
        //   showingTooltipIndicators: [0],
        // ),
      ];
}
