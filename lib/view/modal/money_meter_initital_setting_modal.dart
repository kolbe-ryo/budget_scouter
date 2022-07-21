// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../constant/style.dart';
import '../common/app_bar.dart';
import '../common/currency_select_tile.dart';
import '../common/input_tile.dart';

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
                InputTile(
                  title: 'Reset Balance',
                  hintText: 'Reset or not balance at the beginning of month',
                  numOnly: true,
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
