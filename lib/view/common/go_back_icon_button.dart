// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../constant/style.dart';
import '../page/money_meter_page.dart';

class GoBackIconButton extends ConsumerWidget {
  const GoBackIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goBackState = ref.watch(moneyMeterProvider.select((state) => state.goBackState));
    final isGoBack = goBackState.canBack || goBackState.canGo;
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.arrowRotateLeft,
        size: 30,
        color: isGoBack ? kThemeColor : null,
      ),
      onPressed: () {
        if (goBackState.canBack) {
          ref.read(moneyMeterProvider.notifier).updateGoBack(true);
          return;
        }
        if (goBackState.canGo) {
          ref.read(moneyMeterProvider.notifier).updateGoBack(true);
          return;
        }
      },
    );
  }
}
