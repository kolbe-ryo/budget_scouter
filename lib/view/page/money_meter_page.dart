// Flutter imports:
import 'package:budget_scouter/view/common/app_dialog.dart';
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
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(kSpacing, kSpacing * 2, 0, kSpacing * 2),
                    child: TopCaptionTexts(
                      title: 'Target',
                      content: hadData ? ref.watch(moneyMeterProvider.select((state) => state.target)) : 'No Data',
                    ),
                  ),
                  GestureDetector(
                    child: MoneyMeter(ref.watch(moneyMeterProvider)),
                    onTap: () => showDialog(context: context, builder: (context) => const InputDialog()),
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
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
