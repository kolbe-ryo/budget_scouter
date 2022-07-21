import 'package:budget_scouter/constant/style.dart';
import 'package:budget_scouter/view/common/app_bar.dart';
import 'package:budget_scouter/view/common/currency_select_tile.dart';
import 'package:budget_scouter/view/common/input_tile.dart';
import 'package:flutter/material.dart';

class MoneyMeterInitialSettingModal extends StatelessWidget {
  const MoneyMeterInitialSettingModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            InputTile(title: 'Target', hintText: 'Name for your target money'),
            InputTile(title: 'Initial Balance', hintText: 'Setting your budget for money meter'),
            InputTile(title: 'Reset Balance', hintText: 'Reset or not balance at the beginning of month'),
            CurrencySelectTile(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: kThemeColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
