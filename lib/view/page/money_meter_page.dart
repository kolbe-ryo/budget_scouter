// Flutter imports:
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

class MoneyMeterPage extends ConsumerWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hadData = ref.watch(moneyMeterProvider.select((state) => state.hasdata));
    return Scaffold(
      body: FutureBuilder(
        future: ref.read(moneyMeterProvider.notifier).fetch(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(kSpacing, kSpacing * 2, 0, 0),
                  child: TopCaptionTexts(
                    title: 'Target',
                    content: hadData ? ref.watch(moneyMeterProvider.select((state) => state.target)) : 'No Data',
                  ),
                ),
                MoneyMeter(ref.watch(moneyMeterProvider)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(kSpacing, 0, kSpacing, kSpacing * 2),
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
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
