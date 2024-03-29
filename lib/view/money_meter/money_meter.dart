// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/currency_data_enum.dart';
import '../../enum/meter_in_out_enum.dart';
import '../../model/money_meter_model.dart';
import '../../util/number_formatter.dart';
import 'meter_widget.dart';
import 'money_meter_abstract.dart';
import 'money_meter_additional_widget.dart';

class MoneyMeter extends MoneyMeterAbstract {
  const MoneyMeter(this.moneyMeterModel, this.color, {Key? key}) : super(key: key);

  final MoneyMeterModel moneyMeterModel;
  final Color color;

  @override
  Widget? innerTextWidget(BuildContext context) {
    if (moneyMeterModel.hasdata) {
      return Column(
        children: [
          Text(
            AppLocalizations.of(context)!.balance,
            style: kTextStyleCaption(color: kDarkTextColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  moneyMeterModel.currency.icon,
                  color: color,
                ),
                const SizedBox(width: kSpacing / 2),
                Text(
                  NumberFormatter.currencyFormatter(moneyMeterModel.balance).toString(),
                  style: kTextStyleCaption(color: color),
                ),
              ],
            ),
          ),
          Text(
            '/ ${NumberFormatter.currencyFormatter(moneyMeterModel.initBalance)}',
            style: kTextStyleCaption(color: kDarkTextColor, size: 20),
          ),
        ],
      );
    }
    return null;
  }

  @override
  List<Widget> meterWidgets() {
    if (moneyMeterModel.hasdata) {
      return [
        const MeterWidget(inOutCircle: MeterInOutEnum.outer),
        const MeterWidget(inOutCircle: MeterInOutEnum.inner),
      ];
    }
    return const [MoneyMeterAdditionalWidget()];
  }
}
