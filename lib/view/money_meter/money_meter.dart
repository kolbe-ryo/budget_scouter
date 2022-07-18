// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../enum/meter_in_out_enum.dart';
import '../../enum/meter_radius_enum.dart';
import '../../model/money_meter_model.dart';
import 'meter_widget.dart';
import 'money_meter_abstract.dart';

class MoneyMeter extends MoneyMeterAbstract {
  const MoneyMeter({required this.moneyMeterModel, required this.isLargeMeter, Key? key}) : super(key: key);

  final MoneyMeterModel moneyMeterModel;
  final bool isLargeMeter;

  @override
  Widget innerTextWidget() {
    return isLargeMeter ? Text('REMAIN') : Text('56%');
  }

  @override
  List<MeterWidget> meterWidgets() {
    return isLargeMeter
        ? [
            const MeterWidget(inOutCircle: MeterInOutEnum.outer, meterRadius: MeterRadiusEnum.largeInner),
            const MeterWidget(inOutCircle: MeterInOutEnum.inner, meterRadius: MeterRadiusEnum.largeOuter),
          ]
        : [
            const MeterWidget(inOutCircle: MeterInOutEnum.outer, meterRadius: MeterRadiusEnum.smallInner),
            const MeterWidget(inOutCircle: MeterInOutEnum.inner, meterRadius: MeterRadiusEnum.smallOuter),
          ];
  }
}
