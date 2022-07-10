// Flutter imports:
import 'package:flutter/material.dart';

enum MeterRadiusEnum {
  smallInner,
  smallOuter,
  largeInner,
  largeOuter,
}

extension MeterRadiusEnumExt on MeterRadiusEnum {
  double radius(BoxConstraints constraints) {
    switch (this) {
      case MeterRadiusEnum.smallInner:
        return constraints.maxWidth / 3 - 15;
      case MeterRadiusEnum.smallOuter:
        return constraints.maxWidth / 3;
      case MeterRadiusEnum.largeInner:
        return constraints.maxWidth - 30;
      case MeterRadiusEnum.largeOuter:
        return constraints.maxWidth;
    }
  }
}
