import 'package:budget_scouter/view/money_meter/small_money_meter.dart';
import 'package:flutter/material.dart';

class MoneyMeterPage extends StatelessWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            const Center(
              child: SmallMoneyMeter(),
            ),
          ],
        );
      }),
    );
  }
}
