// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum CurrencyDataEnum {
  @JsonValue(0)
  dollar,
  @JsonValue(1)
  euro,
  @JsonValue(2)
  yen,
  @JsonValue(3)
  sterling,
}

extension CurrencyDataEnumExt on CurrencyDataEnum {
  String name(BuildContext context) {
    switch (this) {
      case CurrencyDataEnum.dollar:
        return AppLocalizations.of(context)!.dollar;
      case CurrencyDataEnum.euro:
        return AppLocalizations.of(context)!.euro;
      case CurrencyDataEnum.yen:
        return AppLocalizations.of(context)!.yen;
      case CurrencyDataEnum.sterling:
        return AppLocalizations.of(context)!.sterling;
    }
  }

  IconData get icon {
    switch (this) {
      case CurrencyDataEnum.dollar:
        return FontAwesomeIcons.dollarSign;
      case CurrencyDataEnum.euro:
        return FontAwesomeIcons.euroSign;
      case CurrencyDataEnum.yen:
        return FontAwesomeIcons.yenSign;
      case CurrencyDataEnum.sterling:
        return FontAwesomeIcons.sterlingSign;
    }
  }
}
