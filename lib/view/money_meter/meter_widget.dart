// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:pie_chart/pie_chart.dart';

// Project imports:
import '../../enum/meter_in_out_enum.dart';
import '../../enum/meter_radius_enum.dart';

class MeterWidget extends StatelessWidget {
  const MeterWidget({
    Key? key,
    required this.inOutCircle,
    required this.meterRadius,
    this.used = 0,
  }) : super(key: key);

  final MeterInOutEnum inOutCircle;
  final MeterRadiusEnum meterRadius;
  final double used;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: meterRadius.constraints(_constraints),
          maxWidth: meterRadius.constraints(_constraints),
        ),
        child: PieChart(
          baseChartColor: inOutCircle.color(),
          chartRadius: meterRadius.radius(_constraints),
          chartType: ChartType.ring,
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
          colorList: const [Colors.black],
          dataMap: {"usedMoney": used},
          initialAngleInDegree: 270,
          legendOptions: const LegendOptions(showLegends: false),
          ringStrokeWidth: 10,
          totalValue: 100,
        ),
      );
    });
  }
}
