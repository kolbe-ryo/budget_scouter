// Flutter imports:
import 'package:flutter/material.dart';

enum MeterInOutEnum {
  inner,
  outer,
}

extension MeterInOutEnumExt on MeterInOutEnum {
  double radius(BoxConstraints constraints) {
    switch (this) {
      case MeterInOutEnum.inner:
        return constraints.maxWidth;
      case MeterInOutEnum.outer:
        return constraints.maxWidth - 50;
    }
  }

  double constraints(BoxConstraints constraints) {
    switch (this) {
      case MeterInOutEnum.inner:
      case MeterInOutEnum.outer:
        return constraints.maxWidth - 10;
    }
  }
}
