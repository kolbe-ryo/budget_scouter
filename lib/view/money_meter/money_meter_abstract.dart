import 'package:budget_scouter/view/money_meter/meter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class MoneyMeterAbstract extends ConsumerWidget {
  const MoneyMeterAbstract({Key? key}) : super(key: key);

  List<MeterWidget> meterWidgets();
  Widget innerTextWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        ...(meterWidgets().map((widget) => Center(child: widget))),
        Center(child: innerTextWidget()),
      ],
    );
  }
}
