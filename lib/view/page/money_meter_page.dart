// Flutter imports:
import 'package:budget_scouter/view/money_meter/money_meter_large.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../money_meter/money_meter_small.dart';

class MoneyMeterPage extends StatelessWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          fit: StackFit.loose,
          children: [
            const Align(
              alignment: Alignment(-1.0, -0.9),
              child: MoneyMeterSmall(),
            ),
            const Align(
              alignment: Alignment(1.0, -0.9),
              child: MoneyMeterSmall(),
            ),
            const Align(
              alignment: Alignment.center,
              child: MoneyMeterLarge(),
            ),
            const Align(
              alignment: Alignment(-1.0, 0.9),
              child: MoneyMeterSmall(),
            ),
            const Align(
              alignment: Alignment(1.0, 0.9),
              child: MoneyMeterSmall(),
            ),
          ],
        );
      }),
    );
  }
}
