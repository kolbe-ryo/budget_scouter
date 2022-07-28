// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';

// Project imports:
import '../../enum/meter_in_out_enum.dart';
import '../../enum/meter_radius_enum.dart';
import '../page/money_meter_page.dart';

class MeterWidget extends ConsumerWidget {
  const MeterWidget({
    Key? key,
    required this.inOutCircle,
    required this.meterRadius,
  }) : super(key: key);

  final MeterInOutEnum inOutCircle;
  final MeterRadiusEnum meterRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountUse = inOutCircle == MeterInOutEnum.outer
        ? ref.watch(moneyMeterProvider.select((state) => state.balance.toDouble()))
        : 0.0;
    final initBalance = ref.watch(moneyMeterProvider.select((state) => state.initBalance.toDouble()));
    return LayoutBuilder(builder: (context, _constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: meterRadius.constraints(_constraints),
          maxWidth: meterRadius.constraints(_constraints),
        ),
        child: PieChart(
          baseChartColor: inOutCircle.color,
          chartRadius: meterRadius.radius(_constraints),
          chartType: ChartType.ring,
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
          colorList: const [Colors.black],
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
