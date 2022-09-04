// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../chart/money_history_chart.dart';
import '../common/top_caption_texts.dart';
import 'money_meter_page.dart';

// page index state
final pageIndexProvider = StateProvider<int>(
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
    final histories =
        ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.moneyConsumptionHistoryModelList));
    final years = histories.map((history) => history.year).toSet().toList();
    final controller = PageController(initialPage: ref.watch(pageIndexProvider));

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
                      title: 'Target',
                      content: ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.target)),
                      isNodata: false,
                    ),
                    const TopCaptionTexts(
                      title: 'Year',
                      content: '2022',
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
