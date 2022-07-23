// Flutter imports:
import 'package:budget_scouter/view/page/money_meter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => ref.read(moneyMeterProvider.notifier).delete(context),
        child: Text('Test'),
      ),
    );
  }
}
