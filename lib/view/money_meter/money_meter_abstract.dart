// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'meter_widget.dart';

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
