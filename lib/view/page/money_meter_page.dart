// Flutter imports:
import 'package:budget_scouter/view/modal/use_money_input_model.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../model/money_meter_model.dart';
import '../common/top_caption_texts.dart';
import '../money_meter/money_meter.dart';
import '../view_model/money_meter_page_view_model.dart';

// provider for money meter initial setting
final moneyMeterProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterModel>(((ref) => MoneyMeterPageViewModel()));

final moneyData = FutureProvider<MoneyMeterModel>(((ref) => ref.read(moneyMeterProvider.notifier).fetch()));

class MoneyMeterPage extends ConsumerWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hadData = ref.watch(moneyMeterProvider.select((state) => state.hasdata));
    AsyncValue<MoneyMeterModel> moneyMeterModel = ref.watch(moneyData);

    return Scaffold(
      body: moneyMeterModel.when(
        loading: () => const SizedBox.shrink(),
        error: (err, stack) => Text('$err'),
        data: (data) => SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(kSpacing, 0, 0, kSpacing * 2),
                child: TopCaptionTexts(
                  title: 'Target',
                  content: hadData ? ref.watch(moneyMeterProvider.select((state) => state.target)) : 'No Data',
                ),
              ),
              GestureDetector(
                child: MoneyMeter(ref.watch(moneyMeterProvider)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const UsemoneyInpuModal()),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kSpacing * 2, horizontal: kSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopCaptionTexts(
                      title: 'Remain Days',
                      content: hadData ? ref.watch(moneyMeterProvider.notifier).remainDays : 'No Data',
                    ),
                    TopCaptionTexts(
                      title: 'Use Rate',
                      content: hadData
                          ? '${ref.watch(moneyMeterProvider.select((state) => state.balanceRatio))}%'
                          : 'No Data',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
