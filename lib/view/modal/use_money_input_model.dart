// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/currency_data_enum.dart';
import '../../main.dart';
import '../../util/number_formatter.dart';
import '../common/app_bar.dart';
import '../common/keyboard.dart';
import '../page/money_meter_page.dart';

final useMoneyState = StateProvider<int>(((ref) => 0));

class UsemoneyInpuModal extends ConsumerWidget {
  const UsemoneyInpuModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        ref.read(useMoneyState.state).update((state) => 0);
        return Future<bool>.value(true);
      },
      child: Scaffold(
        appBar: CustomAppBar.appBar,
        body: Padding(
          padding: const EdgeInsets.all(kSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: kSpacing * 2),
                child: Text(
                  AppLocalizations.of(context)!.expenditure,
                  style: kTextStyleCaption(color: ref.watch(colorThemeProvider), size: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: kSpacing * 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      ref.watch(moneyMeterProvider.select((state) => state.moneyMeterModel.currency)).icon,
                      color: kDarkTextColor,
                      size: 35,
                    ),
                    const SizedBox(width: kSpacing),
                    Text(
                      NumberFormatter.currencyFormatter(ref.watch(useMoneyState)),
                      style: kTextStyleCaption(color: kDarkTextColor),
                    ),
                  ],
                ),
              ),
              const Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
