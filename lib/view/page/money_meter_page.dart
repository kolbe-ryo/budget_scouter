import 'package:budget_scouter/view/organism/meter_widget.dart';
import 'package:flutter/material.dart';

class MoneyMeterPage extends StatelessWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: MeterWidget(isInnerCircle: false, used: 5),
          ),
          const Center(
            child: MeterWidget(isInnerCircle: true),
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
    );
  }
}
