// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../view/page/analysis_page.dart';
import '../view/page/money_meter_page.dart';
import '../view/page/setting_page.dart';

enum BottomNavigationBarEnum {
  moneyMeter,
  analysis,
  setting,
}

extension BottomNavigationBarEnumExt on BottomNavigationBarEnum {
  BottomNavigationBarItem bottomNavigationBarItem(BuildContext context) {
    switch (this) {
      case BottomNavigationBarEnum.moneyMeter:
        return const BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.gaugeHigh), label: 'Meter');
      case BottomNavigationBarEnum.analysis:
        return const BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Analysis');
      case BottomNavigationBarEnum.setting:
        return const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting');
    }
  }

  Widget page() {
    switch (this) {
      case BottomNavigationBarEnum.moneyMeter:
        return const MoneyMeterPage();
      case BottomNavigationBarEnum.analysis:
        return const AnalysisPage();
      case BottomNavigationBarEnum.setting:
        return const SettingPage();
    }
  }
}
