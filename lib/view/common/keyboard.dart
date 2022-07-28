// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../enum/keyboard_value_enum.dart';
import '../modal/use_money_input_model.dart';
import '../page/money_meter_page.dart';

class Keyboard extends ConsumerWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.count(
        childAspectRatio: 1.2,
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        children: KeyboardValue.values.map((key) {
          return GridTile(
            child: ElevatedButton(
              child: Text(
                key.value,
                style: kTextStyleCaption(size: 30),
              ),
              onPressed: () {
                final isBack = _setValue(key, ref);
                if (isBack) {
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
        ref.read(useMoneyState.state).update((state) => 0);
        return true;
      default:
        ref.read(useMoneyState.state).update((state) => int.parse(state.toString() + key.value));
        return false;
    }
  }
}
