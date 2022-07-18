// Flutter imports:
import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/logo.png',
      width: 170,
    );
  }
}
