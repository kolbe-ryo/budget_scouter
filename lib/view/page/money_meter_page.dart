// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/alignment_position.dart';
import '../../model/money_meter_model.dart';
import '../money_meter/money_meter.dart';
import '../view_model/money_meter_page_view_model.dart';

// Management of MoneyMeterModelList
final moneyMeterModelListProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterModel>((ref) => MoneyMeterPageViewModel());

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
                  for (int index = 0; index < 3; index++)
                    Align(
                      alignment: kAlignmentPosition.elementAt(index),
                      child: MoneyMeter(ref.watch(moneyMeterModelListProvider)),
                    ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        });
  }
}
