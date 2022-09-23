// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../main.dart';
import '../../model/money_meter_model.dart';
import '../../util/number_formatter.dart';
import '../common/top_caption_texts.dart';
import '../modal/use_money_input_model.dart';
import '../money_meter/money_meter.dart';
import '../state/money_meter_page_state.dart';
import '../view_model/money_meter_page_view_model.dart';

// provider for money meter initial setting
final moneyMeterProvider =
    StateNotifierProvider<MoneyMeterPageViewModel, MoneyMeterPageState>(((ref) => MoneyMeterPageViewModel()));

// fetch from local data
final moneyData = FutureProvider<MoneyMeterModel>(((ref) => ref.read(moneyMeterProvider.notifier).fetch()));

class MoneyMeterPage extends ConsumerWidget {
  const MoneyMeterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasData = ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.hasdata));
    AsyncValue<MoneyMeterModel> moneyMeterModel = ref.watch(moneyData);
    return Scaffold(
      body: moneyMeterModel.when(
        loading: () => const SizedBox.shrink(),
        error: (err, stack) => Text('$err'),
        data: (data) {
          return _body(context, ref, hasData);
        },
      ),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref, bool hasData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(kSpacing, 0, kSpacing, kSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TopCaptionTexts(
                title: hasData ? AppLocalizations.of(context)!.target : '',
                content: hasData ? ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.target)) : '',
                isNodata: !hasData,
              ),
              TopCaptionTexts(
                title: hasData ? AppLocalizations.of(context)!.year : '',
                content: hasData
                    ? ref.watch(moneyMeterProvider.select((state) =>
                        NumberFormatter.createdAtFotmat(state.moneyMeterModel.year, state.moneyMeterModel.month)))
                    : '',
                isNodata: !hasData,
              ),
            ],
          ),
        ),
        GestureDetector(
          child: MoneyMeter(
              ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel)), ref.watch(colorThemeProvider)),
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
          padding: const EdgeInsets.fromLTRB(kSpacing, 0, kSpacing, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopCaptionTexts(
                title: hasData ? AppLocalizations.of(context)!.remain_days : '',
                content: hasData ? ref.watch(moneyMeterProvider.notifier).remainDays : '',
                isNodata: !hasData,
              ),
              TopCaptionTexts(
                title: hasData ? AppLocalizations.of(context)!.use_rate : '',
                content: hasData
                    ? '${ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.balanceRatio))}%'
                    : '',
                isNodata: !hasData,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
