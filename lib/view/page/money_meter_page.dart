// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../model/money_meter_model.dart';
import '../common/top_caption_texts.dart';
import '../modal/use_money_input_model.dart';
import '../money_meter/money_meter.dart';
import '../view_model/money_meter_page_view_model.dart';

// provider for money meter initial setting
final moneyMeterProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterModel>(((ref) => MoneyMeterPageViewModel()));

// fetch from local data
final moneyData = FutureProvider<MoneyMeterModel>(((ref) => ref.read(moneyMeterProvider.notifier).fetch()));

// go-back state provider
final goBackStateProvider = StateProvider(((ref) => null));

class MoneyMeterPage extends ConsumerWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasData = ref.watch(moneyMeterProvider.select((state) => state.hasdata));
    AsyncValue<MoneyMeterModel> moneyMeterModel = ref.watch(moneyData);
    return Scaffold(
      body: moneyMeterModel.when(
          loading: () => const SizedBox.shrink(),
          error: (err, stack) => Text('$err'),
          data: (data) {
            if (hasData) {
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: _body(context, ref, hasData),
              );
            } else {
              return _body(context, ref, hasData);
            }
          }),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref, bool hasData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(kSpacing, 0, 0, kSpacing * 2),
          child: TopCaptionTexts(
            title: 'Target',
            content: hasData ? ref.watch(moneyMeterProvider.select((state) => state.target)) : 'No Data',
            isNodata: !hasData,
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
                content: hasData ? ref.watch(moneyMeterProvider.notifier).remainDays : 'No Data',
                isNodata: !hasData,
              ),
              TopCaptionTexts(
                title: 'Use Rate',
                content:
                    hasData ? '${ref.watch(moneyMeterProvider.select((state) => state.balanceRatio))}%' : 'No Data',
                isNodata: !hasData,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
