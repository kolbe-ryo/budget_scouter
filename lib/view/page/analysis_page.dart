// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../chart/money_history_chart.dart';
import '../common/top_caption_texts.dart';
import 'money_meter_page.dart';

// page index state
final initPageIndexProvider = StateProvider<int>(
  ((ref) =>
      ref
          .watch(moneyMeterProvider.select((state) => state.moneyMeterModel.moneyConsumptionHistoryModelList))
          .map((state) => state.year)
          .toSet()
          .toList()
          .length -
      1),
);

class AnalysisPage extends ConsumerWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasData = ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.hasdata));
    final years = ref.watch(moneyMeterProvider.select((state) =>
        state.moneyMeterModel.moneyConsumptionHistoryModelList.map((history) => history.year).toSet().toList()));
    final controller = PageController(initialPage: ref.watch(initPageIndexProvider));

    return hasData
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(kSpacing, 0, kSpacing, kSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TopCaptionTexts(
                      title: AppLocalizations.of(context)!.target,
                      content: ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.target)),
                      isNodata: false,
                    ),
                    TopCaptionTexts(
                      title: AppLocalizations.of(context)!.year,
                      content: years[ref.watch(initPageIndexProvider)].toString(),
                      isNodata: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 5,
                child: PageView.builder(
                  itemCount: years.length,
                  itemBuilder: (context, index) {
                    years.sort(((a, b) => a.compareTo(b)));
                    WidgetsBinding.instance!.addPostFrameCallback(
                      (timeStamp) => ref.read(initPageIndexProvider.notifier).update(((state) => index)),
                    );
                    return MoneyHistoryChart(years[index]);
                  },
                  controller: controller,
                ),
              ),
            ],
          )
        : const Center(
            child: FaIcon(
              FontAwesomeIcons.chartColumn,
              size: 50,
            ),
          );
  }
}
