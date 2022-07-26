import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/view/common/app_bar.dart';
import 'package:budget_scouter/view/common/input_tile.dart';
import 'package:budget_scouter/view/page/money_meter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final useMoneyState = StateProvider<int>(((ref) => 0));

class UsemoneyInpuModal extends ConsumerWidget {
  const UsemoneyInpuModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar.appBar,
      body: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InputTile(
              title: 'Consumption Money',
              hintText: 'Input use money / ex) 1200',
              numOnly: true,
              isTarget: false,
              isUseMoney: true,
            ),
            const SizedBox(height: kSpacing),
            TextButton(
              child: const Text(
                'OK',
                style: kTextStylePrimary,
              ),
              onPressed: () async {
                final useMoney = ref.watch(useMoneyState);
                ref.read(moneyMeterProvider.notifier).use(useMoney);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
