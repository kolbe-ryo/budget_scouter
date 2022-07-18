// Flutter imports:
import 'package:budget_scouter/view/money_meter/money_meter.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../model/money_meter_model_list.dart';
import '../view_model/money_meter_page_view_model.dart';

// MoneyMeterModelListの管理
final moneyMeterModelListProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterModelList>((ref) => MoneyMeterPageViewModel());

class MoneyMeterPage extends ConsumerWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.read(moneyMeterModelListProvider.notifier).fetch(),
        builder: (context, asyncValue) {
          if (asyncValue.hasData) {
            return Scaffold(
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: MoneyMeter(
                          moneyMeterModel: ref.watch(
                            moneyMeterModelListProvider.select(
                              (state) => state.moneyMeterModelList.firstWhere((moneyModel) => moneyModel.index == 0),
                            ),
                          ),
                          isLargeMeter: true,
                        ),
                      ),
                      // const Align(
                      //   alignment: Alignment(-1.0, -0.8),
                      //   child: MoneyMeterSmall(),
                      // ),
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
                },
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
