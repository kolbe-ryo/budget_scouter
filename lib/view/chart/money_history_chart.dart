// Flutter imports:
import 'dart:math';
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
        barGroups: barGroups(historyList),
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: historyList.map((e) => e.remainedBalance).toList().reduce((value, element) => max(value, element)) * 1.2,
        minY: historyList
            .map((e) => e.remainedBalance > 0 ? 0 : e.remainedBalance)
            .toList()
            .reduce((value, element) => min(value, element))
            .toDouble(),
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

  FlBorderData get borderData => FlBorderData(show: false);

  final _barsGradient = const LinearGradient(
    colors: [
      Colors.lightBlueAccent,
      Colors.greenAccent,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  List<BarChartGroupData> barGroups(List<MoneyConsumptionHistoryModel> histories) => histories
      .asMap()
      .entries
      .map(
        (element) => BarChartGroupData(
          x: element.key,
          barRods: [
            BarChartRodData(
              toY: element.value.remainedBalance.toDouble(),
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      )
      .toList();
}
