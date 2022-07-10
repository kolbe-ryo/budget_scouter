import 'package:budget_scouter/view/organism/money_meter.dart';
import 'package:flutter/material.dart';

class MoneyMeterPage extends StatelessWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            const Center(
              child: MoneyMeter(isInnerCircle: false, used: 5),
            ),
            const Center(
              child: MoneyMeter(isInnerCircle: true),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Balance',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '¥ 10,000',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '/ ¥ 50,000',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
