// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../main.dart';
import '../../model/money_consumption_history_model.dart';
import '../../model/money_meter_model.dart';
import '../common/app_bar.dart';
import '../common/app_dialog.dart';
import '../common/check_reset_balance_radio_button.dart';
import '../common/currency_select_tile.dart';
import '../common/input_tile.dart';
import '../page/money_meter_page.dart';

// Temp state
final initialMoneyMeterStateProvider = StateProvider(((ref) => const MoneyMeterModel()));

class MoneyMeterInitialSettingModal extends ConsumerWidget {
  const MoneyMeterInitialSettingModal({Key? key}) : super(key: key);

  Future<bool> _dipose(WidgetRef ref) async {
    ref.read(initialMoneyMeterStateProvider.state).update((state) => const MoneyMeterModel());
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hadData = ref.watch(moneyMeterProvider.select((value) => value.moneyMeterModel.hasdata));
    return WillPopScope(
      onWillPop: () async => _dipose(ref),
      child: Scaffold(
        appBar: CustomAppBar.appBar,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InputTile(
                    title: AppLocalizations.of(context)!.target,
                    hintText: AppLocalizations.of(context)!.hint_target,
                    numOnly: false,
                    isTarget: true,
                  ),
                  InputTile(
                    title: AppLocalizations.of(context)!.init_balance,
                    hintText: AppLocalizations.of(context)!.hint_balance,
                    numOnly: true,
                    isTarget: false,
                  ),
                  CheckResetBalanceRadioButton(
                    title: AppLocalizations.of(context)!.forward_balance,
                    description: AppLocalizations.of(context)!.hint_reset_balance,
                  ),
                  const CurrencySelectTile(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: hadData ? const Icon(Icons.edit) : const Icon(Icons.add),
          backgroundColor: ref.watch(colorThemeProvider),
          onPressed: () {
            final inititalMoneyMeterModel = ref.watch(initialMoneyMeterStateProvider);
            final moneyMeterModel = ref.watch(moneyMeterProvider.select((value) => value.moneyMeterModel));

            // Validate for nothing to input
            if (moneyMeterModel.hasdata) {
              ref.read(moneyMeterProvider.notifier).save(
                    moneyMeterModel.copyWith(
                      target: inititalMoneyMeterModel.target,
                      initBalance: inititalMoneyMeterModel.initBalance,
                      isForwardBalance: inititalMoneyMeterModel.isForwardBalance,
                      currency: inititalMoneyMeterModel.currency,
                    ),
                  );
              Navigator.pop(context);
            } else if (inititalMoneyMeterModel.target.isNotEmpty && inititalMoneyMeterModel.initBalance > 0) {
              ref.read(moneyMeterProvider.notifier).save(
                    inititalMoneyMeterModel.copyWith(
                      hasdata: true,
                      balance: inititalMoneyMeterModel.initBalance,
                      year: DateTime.now().year,
                      month: DateTime.now().month,
                      moneyConsumptionHistoryModelList: [
                        MoneyConsumptionHistoryModel(
                          year: DateTime.now().year,
                          month: DateTime.now().month,
                          initBalance: inititalMoneyMeterModel.initBalance,
                          remainedBalance: inititalMoneyMeterModel.initBalance,
                        ),
                      ],
                    ),
                  );
              Navigator.pop(context);
            } else {
              showDialog(
                context: context,
                builder: (context) => AppDialog(AppLocalizations.of(context)!.validation_field_text),
              );
            }
          },
        ),
      ),
    );
  }
}
