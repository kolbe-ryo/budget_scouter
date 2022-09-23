// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        return BottomNavigationBarItem(
          icon: const FaIcon(FontAwesomeIcons.gaugeHigh),
          label: AppLocalizations.of(context)!.meter,
        );
      case BottomNavigationBarEnum.analysis:
        return BottomNavigationBarItem(
          icon: const Icon(Icons.bar_chart),
          label: AppLocalizations.of(context)!.analysis,
        );
      case BottomNavigationBarEnum.setting:
        return BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: AppLocalizations.of(context)!.setting,
        );
    }
  }

  Widget get page {
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
