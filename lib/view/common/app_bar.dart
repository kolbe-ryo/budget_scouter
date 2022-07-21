// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constant/style.dart';
import 'logo_image.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key}) : super(key: key);

  static AppBar get appBar => AppBar(
        title: const LogoImage(),
        backgroundColor: kDarkBackColor,
        elevation: 0,
      );
}
