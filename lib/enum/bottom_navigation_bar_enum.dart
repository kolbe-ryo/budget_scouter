import 'package:budget_scouter/view/page/analysis_page.dart';
import 'package:budget_scouter/view/page/money_meter_page.dart';
import 'package:budget_scouter/view/page/setting_page.dart';
import 'package:flutter/material.dart';

enum BottomNavigationBarEnum {
  moneyMeter,
  analysis,
  setting,
}

extension BottomNavigationBarEnumExt on BottomNavigationBarEnum {
  BottomNavigationBarItem bottomNavigationBarItem(BuildContext context) {
    switch (this) {
      case BottomNavigationBarEnum.moneyMeter:
        return const BottomNavigationBarItem(icon: Icon(Icons.gas_meter), label: 'Meter');
      case BottomNavigationBarEnum.analysis:
        return const BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Analysis');
      case BottomNavigationBarEnum.setting:
        return const BottomNavigationBarItem(icon: Icon(Icons.gas_meter), label: 'Setting');
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
