// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../page/setting_page.dart';

abstract class MoneyMeterAbstract extends ConsumerWidget {
  const MoneyMeterAbstract({Key? key}) : super(key: key);

  List<Widget> meterWidgets();
  Widget? innerTextWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ...(meterWidgets().map((widget) => widget)),
        innerTextWidget() ?? const SizedBox.shrink(),
      ],
    );
  }
}
