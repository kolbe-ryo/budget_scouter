// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/currency_data_enum.dart';
import '../../main.dart';
import '../modal/money_meter_initital_setting_modal.dart';
import '../page/money_meter_page.dart';

class SelectedIconButton extends ConsumerWidget {
  const SelectedIconButton(this.currency, {Key? key}) : super(key: key);

  final CurrencyDataEnum currency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectCurrency = ref.watch(initialMoneyMeterStateProvider.select((state) => state.currency));
    final isSelectedThis = currency == selectCurrency;
    return Column(
      children: [
        IconButton(
          icon: FaIcon(
            currency.icon,
            color: isSelectedThis ? ref.watch(colorThemeProvider) : kDarkTextColor,
            size: isSelectedThis ? 25 : 20,
          ),
          onPressed: () =>
              ref.read(initialMoneyMeterStateProvider.state).update((state) => state.copyWith(currency: currency)),
        ),
        DefaultTextStyle(
          style: kTextStyleHint,
          child: Text(
            currency.name,
            style: TextStyle(color: isSelectedThis ? ref.watch(colorThemeProvider) : kDarkTextColor),
          ),
        )
      ],
    );
  }
}
