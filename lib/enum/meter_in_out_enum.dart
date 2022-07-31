// Flutter imports:
import 'package:flutter/material.dart';

enum MeterInOutEnum {
  inner,
  outer,
}

extension MeterInOutEnumExt on MeterInOutEnum {
  Color get color {
    switch (this) {
      case MeterInOutEnum.inner:
        return Colors.black;
      case MeterInOutEnum.outer:
        return Colors.deepOrange;
    }
  }

  double radius(BoxConstraints constraints) {
    switch (this) {
      case MeterInOutEnum.inner:
        return constraints.maxWidth;
      case MeterInOutEnum.outer:
        return constraints.maxWidth - 45;
    }
  }

  double constraints(BoxConstraints constraints) {
    switch (this) {
      case MeterInOutEnum.inner:
      case MeterInOutEnum.outer:
        return constraints.maxWidth;
    }
  }
}
