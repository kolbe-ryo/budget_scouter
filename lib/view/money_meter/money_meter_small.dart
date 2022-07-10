// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../enum/meter_in_out_enum.dart';
import '../../enum/meter_radius_enum.dart';
import 'meter_widget.dart';
import 'money_meter_abstract.dart';

class MoneyMeterSmall extends MoneyMeterAbstract {
  const MoneyMeterSmall({Key? key}) : super(key: key);

  @override
  Widget innerTextWidget() {
    return Text('56%');
  }

  @override
  List<MeterWidget> meterWidgets() {
    return [
      const MeterWidget(inOutCircle: MeterInOutEnum.outer, meterRadius: MeterRadiusEnum.smallInner),
    ];
  }
}
