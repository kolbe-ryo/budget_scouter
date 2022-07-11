// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../model/money_meter_model_list.dart';
import '../money_meter/money_meter_large.dart';
import '../money_meter/money_meter_small.dart';
import '../view_model/money_meter_page_view_model.dart';

// MoneyMeterModelListの管理
final moneyMeterModelListProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterModelList>((ref) => MoneyMeterPageViewModel());

class MoneyMeterPage extends ConsumerWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Align(
              alignment: const Alignment(-1.0, -0.8),
              child: MoneyMeterSmall(
                ref.watch(
                  moneyMeterModelListProvider.select(
                    (state) => state.moneyMeterModelList.firstWhere((moneyModel) => moneyModel.index == 0),
                  ),
                ),
              ),
            ),
            // const Align(
            //   alignment: Alignment(1.0, -0.8),
            //   child: MoneyMeterSmall(),
            // ),
            // const Align(
            //   alignment: Alignment.center,
            //   child: MoneyMeterLarge(),
            // ),
            // const Align(
            //   alignment: Alignment(-1.0, 0.8),
            //   child: MoneyMeterSmall(),
            // ),
            // const Align(
            //   alignment: Alignment(1.0, 0.8),
            //   child: MoneyMeterSmall(),
            // ),
          ],
        );
      }),
    );
  }
}
