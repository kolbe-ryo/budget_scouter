// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../enum/meter_in_out_enum.dart';
import '../../enum/meter_radius_enum.dart';
import '../../model/money_meter_model.dart';
import 'meter_widget.dart';
import 'money_meter_abstract.dart';
import 'money_meter_additional_widget.dart';

class MoneyMeter extends MoneyMeterAbstract {
  const MoneyMeter(this.moneyMeterModel, {Key? key}) : super(key: key);

  final MoneyMeterModel moneyMeterModel;

  @override
  Widget? innerTextWidget() {
    if (moneyMeterModel.hasdata) {
      return const Text('REMAIN');
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
