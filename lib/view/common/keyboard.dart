// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/keyboard_value_enum.dart';
import '../../main.dart';
import '../modal/use_money_input_model.dart';
import '../page/money_meter_page.dart';

class Keyboard extends ConsumerWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: (MediaQuery.of(context).size.width - kSpacing * 2) * 1.2,
          child: GridView.count(
            childAspectRatio: 1.2,
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            physics: const NeverScrollableScrollPhysics(),
            children: KeyboardValue.values.map((key) {
              return GridTile(
                child: ElevatedButton(
                  child: Text(
                    key.value,
                    style: kTextStyleCaption(color: ref.watch(colorThemeProvider), size: 30),
                  ),
                  onPressed: () async {
                    final isBack = _setValue(key, ref);
                    if (isBack) {
                      // Loading
                      showProgressDialog(context);
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.of(context).pop();

                      // Back to top page
                      ref.read(useMoneyState.state).update((state) => 0);
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    primary: kDarkBackColor,
                    shadowColor: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  bool _setValue(KeyboardValue key, WidgetRef ref) {
    switch (key) {
      case KeyboardValue.clear:
        ref.read(useMoneyState.state).update((state) => 0);
        return false;
      case KeyboardValue.ok:
        final money = ref.watch(useMoneyState);
        ref.read(moneyMeterProvider.notifier).use(money);
        ref.read(moneyMeterProvider.notifier).canGoBack(money);
        return true;
      default:
        ref.read(useMoneyState.state).update((state) => int.parse(state.toString() + key.value));
        return false;
    }
  }

  void showProgressDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
