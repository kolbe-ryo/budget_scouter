import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/view/common/logo_image.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key}) : super(key: key);

  static AppBar get appBar => AppBar(
        title: const LogoImage(),
        backgroundColor: kDarkBackColor,
        elevation: 0,
      );
}
