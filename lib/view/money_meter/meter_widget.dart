// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';

// Project imports:
import '../../enum/meter_in_out_enum.dart';
import '../../main.dart';
import '../page/money_meter_page.dart';

class MeterWidget extends ConsumerWidget {
  const MeterWidget({Key? key, required this.inOutCircle}) : super(key: key);

  final MeterInOutEnum inOutCircle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountUse = inOutCircle == MeterInOutEnum.outer
        ? ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.balance.toDouble()))
        : 0.0;
    final initBalance = ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.initBalance.toDouble()));
    final isForward = ref
        .watch(moneyMeterProvider.select((state) => state.moneyMeterModel.initBalance < state.moneyMeterModel.balance));

    return LayoutBuilder(builder: (context, _constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: inOutCircle.constraints(_constraints),
          maxWidth: inOutCircle.constraints(_constraints),
        ),
        child: PieChart(
          animationDuration: const Duration(seconds: 3),
          baseChartColor: inOutCircle == MeterInOutEnum.outer ? ref.watch(colorThemeProvider) : Colors.black,
          chartRadius: inOutCircle.radius(_constraints),
          chartType: ChartType.ring,
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
          colorList: [isForward && inOutCircle == MeterInOutEnum.outer ? Colors.greenAccent : Colors.black],
          dataMap: {"usedMoney": initBalance - amountUse},
          initialAngleInDegree: 270,
          legendOptions: const LegendOptions(showLegends: false),
          ringStrokeWidth: 20,
          totalValue: initBalance,
        ),
      );
    });
  }
}
