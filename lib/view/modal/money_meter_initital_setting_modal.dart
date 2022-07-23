// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../constant/style.dart';
import '../../model/money_meter_model.dart';
import '../common/app_bar.dart';
import '../common/check_reset_balance_radio_button.dart';
import '../common/currency_select_tile.dart';
import '../common/input_tile.dart';

// Temp state
final initialMoneyMeterStateProvider = StateProvider(((ref) => const MoneyMeterModel()));

class MoneyMeterInitialSettingModal extends StatelessWidget {
  const MoneyMeterInitialSettingModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                InputTile(
                  title: 'Target',
                  hintText: 'Name for your target money',
                  numOnly: false,
                ),
                InputTile(
                  title: 'Initial Balance',
                  hintText: 'Setting your budget for money meter',
                  numOnly: true,
                ),
                CheckResetBalanceRadioButton(
                  title: 'Reset Balance',
                  description: 'Reset or not balance at the beginning of month',
                ),
                CurrencySelectTile(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: kThemeColor,
        onPressed: () async {
          Navigator.pop(context);
        },
      ),
    );
  }
}
