// Flutter imports:
import 'package:flutter/material.dart';

const kSpacing = 16.0;

kTextStyleCaption({Color? color = Colors.pinkAccent, double? size = 35}) => TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );

kTextStylePrimary(Color color) => TextStyle(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );

const kTextStyleSecondary = TextStyle(
  color: kDarkTextColor,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const kTextStyleHint = TextStyle(
  color: kDarkTextColor,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);

const kDarkBackColor = Color(0xff303030);

const kDarkTextColor = Color(0xb3ffffff);
