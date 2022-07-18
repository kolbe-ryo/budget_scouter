// Flutter imports:
import 'package:budget_scouter/constant/alignment_position.dart';
import 'package:budget_scouter/model/money_meter_model.dart';

import '../money_meter/money_meter.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../model/money_meter_model_list.dart';
import '../view_model/money_meter_page_view_model.dart';

// Management of MoneyMeterModelList
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
              body: Stack(
                children: [
                  for (int index = 0; index < 5; index++)
                    Align(
                      alignment: kAlignmentPosition.elementAt(index),
                      child: MoneyMeter(
                        ref.watch(
                          moneyMeterModelListProvider.select(
                            (state) => state.moneyMeterModelList.firstWhere((moneyModel) => moneyModel.index == index,
                                orElse: () => const MoneyMeterModel()),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
