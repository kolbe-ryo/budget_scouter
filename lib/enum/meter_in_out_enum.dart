// Flutter imports:
import 'package:flutter/material.dart';

enum MeterInOutEnum {
  inner,
  outer,
}

extension MeterInOutEnumExt on MeterInOutEnum {
  Color color() {
    switch (this) {
      case MeterInOutEnum.inner:
        return Colors.black;
      case MeterInOutEnum.outer:
        return Colors.deepOrange;
    }
  }
}
