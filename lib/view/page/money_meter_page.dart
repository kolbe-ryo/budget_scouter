// Flutter imports:
import 'package:budget_scouter/model/money_meter_model_list.dart';
import 'package:budget_scouter/view/money_meter/money_meter_large.dart';
import 'package:budget_scouter/view/view_model/money_meter_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../money_meter/money_meter_small.dart';

// MoneyMeterModelListの管理
final moneyMeterModelListProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterModelList>((ref) => MoneyMeterPageViewModel());

class MoneyMeterPage extends StatelessWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            const Align(
              alignment: Alignment(-1.0, -0.8),
              child: MoneyMeterSmall(),
            ),
            const Align(
              alignment: Alignment(1.0, -0.8),
              child: MoneyMeterSmall(),
            ),
            const Align(
              alignment: Alignment.center,
              child: MoneyMeterLarge(),
            ),
            const Align(
              alignment: Alignment(-1.0, 0.8),
              child: MoneyMeterSmall(),
            ),
            const Align(
              alignment: Alignment(1.0, 0.8),
              child: MoneyMeterSmall(),
            ),
          ],
        );
      }),
    );
  }
}
