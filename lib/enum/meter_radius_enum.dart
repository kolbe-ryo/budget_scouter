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
        return constraints.maxWidth / 3 - 30;
      case MeterRadiusEnum.smallOuter:
        return constraints.maxWidth / 3;
      case MeterRadiusEnum.largeInner:
        return constraints.maxWidth - 45;
      case MeterRadiusEnum.largeOuter:
        return constraints.maxWidth;
    }
  }

  double constraints(BoxConstraints constraints) {
    switch (this) {
      case MeterRadiusEnum.smallInner:
      case MeterRadiusEnum.smallOuter:
        return constraints.maxWidth / 3;
      case MeterRadiusEnum.largeInner:
      case MeterRadiusEnum.largeOuter:
        return constraints.maxWidth;
    }
  }
}
