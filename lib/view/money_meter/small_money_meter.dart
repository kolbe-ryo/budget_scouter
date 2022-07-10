import 'package:budget_scouter/enum/meter_in_out_enum.dart';
import 'package:budget_scouter/enum/meter_radius_enum.dart';
import 'package:budget_scouter/view/money_meter/meter_widget.dart';
import 'package:budget_scouter/view/money_meter/money_meter_abstract.dart';
import 'package:flutter/material.dart';

class SmallMoneyMeter extends MoneyMeterAbstract {
  const SmallMoneyMeter({Key? key}) : super(key: key);

  @override
  Widget innerTextWidget() {
    return Text('56%');
  }

  @override
  List<MeterWidget> meterWidgets() {
    return [
      const MeterWidget(inOutCircle: MeterInOutEnum.outer, meterRadius: MeterRadiusEnum.smallInner),
      const MeterWidget(inOutCircle: MeterInOutEnum.inner, meterRadius: MeterRadiusEnum.smallOuter),
    ];
  }
}
