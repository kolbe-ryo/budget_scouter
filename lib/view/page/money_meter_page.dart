// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../money_meter/small_money_meter.dart';

class MoneyMeterPage extends StatelessWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: SmallMoneyMeter(),
            ),
          ],
        );
      }),
    );
  }
}
