import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class MoneyMeter extends StatelessWidget {
  const MoneyMeter({
    Key? key,
    required this.isInnerCircle,
    this.used = 0,
  }) : super(key: key);

  final bool isInnerCircle;
  final double used;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return PieChart(
        baseChartColor: isInnerCircle ? Colors.black : Colors.deepOrange,
        chartRadius: isInnerCircle ? constraints.maxWidth - 35 : null,
        chartType: ChartType.ring,
        chartValuesOptions: const ChartValuesOptions(showChartValues: false),
        colorList: const [Colors.black],
        dataMap: {"usedMoney": used},
        initialAngleInDegree: 270,
        legendOptions: const LegendOptions(showLegends: false),
        ringStrokeWidth: 10,
        totalValue: 20,
      );
    });
  }
}
