import 'package:flutter/material.dart';
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
  String get name {
    switch (this) {
      case CurrencyDataEnum.dollar:
        return 'Dollar';
      case CurrencyDataEnum.euro:
        return 'Euro';
      case CurrencyDataEnum.yen:
        return 'Yen';
      case CurrencyDataEnum.sterling:
        return 'Sterling';
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
