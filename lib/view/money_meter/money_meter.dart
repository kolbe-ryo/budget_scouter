// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/currency_data_enum.dart';
import '../../enum/meter_in_out_enum.dart';
import '../../enum/meter_radius_enum.dart';
import '../../model/money_meter_model.dart';
import '../../util/number_formatter.dart';
import 'meter_widget.dart';
import 'money_meter_abstract.dart';
import 'money_meter_additional_widget.dart';

class MoneyMeter extends MoneyMeterAbstract {
  const MoneyMeter(this.moneyMeterModel, {Key? key}) : super(key: key);

  final MoneyMeterModel moneyMeterModel;

  @override
  Widget? innerTextWidget() {
    if (moneyMeterModel.hasdata) {
      return Column(
        children: [
          Text(
            'Balance',
            style: kTextStyleCaption(color: kDarkTextColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(moneyMeterModel.currency.icon),
              const SizedBox(width: kSpacing / 2),
              Text(
                NumberFormatter.currencyFormatter(moneyMeterModel.balance).toString(),
                style: kTextStyleCaption(color: kDarkTextColor),
              ),
            ],
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
        const MeterWidget(inOutCircle: MeterInOutEnum.outer, meterRadius: MeterRadiusEnum.largeInner),
        const MeterWidget(inOutCircle: MeterInOutEnum.inner, meterRadius: MeterRadiusEnum.largeOuter),
      ];
    }
    return const [MoneyMeterAdditionalWidget()];
  }
}
