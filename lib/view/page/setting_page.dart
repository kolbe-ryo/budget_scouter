// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'money_meter_page.dart';

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
