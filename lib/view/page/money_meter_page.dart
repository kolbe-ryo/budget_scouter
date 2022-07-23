// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../model/money_meter_model.dart';
import '../money_meter/money_meter.dart';
import '../view_model/money_meter_page_view_model.dart';

// provider for money meter initial setting
final moneyMeterProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterModel>(((ref) => MoneyMeterPageViewModel()));

class MoneyMeterPage extends ConsumerWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: MoneyMeter(ref.watch(moneyMeterProvider))),
    );
  }
}
