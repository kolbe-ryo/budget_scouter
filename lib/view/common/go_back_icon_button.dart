import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/view/page/money_meter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoBackIconButton extends ConsumerWidget {
  const GoBackIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goBackState = ref.watch(moneyMeterProvider.select((state) => state.goBackState));

    if (goBackState.canBack) {
      return IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowRotateLeft,
          size: 30,
          color: kThemeColor,
        ),
        onPressed: () => ref.read(moneyMeterProvider.notifier).updateGoBack(true),
      );
    } else if (goBackState.canGo) {
      return IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.arrowRotateRight,
          size: 30,
          color: kThemeColor,
        ),
        onPressed: () => ref.read(moneyMeterProvider.notifier).updateGoBack(false),
      );
    } else {
      return const IconButton(
        icon: FaIcon(
          FontAwesomeIcons.arrowRotateLeft,
          size: 30,
        ),
        onPressed: null,
      );
    }
  }
}
