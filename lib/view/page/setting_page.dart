// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../model/money_consumption_history_model.dart';
import '../common/app_dialog.dart';
import '../common/setting_tile.dart';
import '../modal/money_meter_initital_setting_modal.dart';
import 'about_app_webview.dart';
import 'money_meter_page.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(moneyMeterProvider).moneyMeterModel;
    return Scaffold(
      body: Column(
        children: [
          SettingTile(
            title: '編集する',
            icon: Icons.edit,
            onTap: model.hasdata
                ? () {
                    ref.read(initialMoneyMeterStateProvider.notifier).update(
                          (state) => state.copyWith(
                            target: model.target,
                            initBalance: model.initBalance,
                            isForwardBalance: model.isForwardBalance,
                            currency: model.currency,
                          ),
                        );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const MoneyMeterInitialSettingModal()),
                        fullscreenDialog: true,
                      ),
                    );
                  }
                : () => showDialog(
                      context: context,
                      builder: (context) => const AppDialog('Target and Initial Balance field are required'),
                    ),
          ),
          SettingTile(
            title: 'リセット',
            icon: Icons.delete,
            onTap: model.hasdata
                ? () {
                    // TODO: モーダルで確認し、全ての設定をリセットする
                  }
                : () => showDialog(
                      context: context,
                      builder: (context) => const AppDialog('Target and Initial Balance field are required'),
                    ),
          ),
          SettingTile(
            title: 'このアプリについて',
            icon: Icons.app_registration,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const AboutAppWebview()),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => ref.read(moneyMeterProvider.notifier).delete(context),
            child: const Text('削除'),
          ),
          ElevatedButton(
            onPressed: () =>
                ref.read(moneyMeterProvider.notifier).save(model.copyWith(moneyConsumptionHistoryModelList: _list)),
            child: const Text('履歴追加'),
          ),
          ElevatedButton(
            onPressed: () => ref.read(moneyMeterProvider.notifier).save(
                  model.copyWith(
                    hasdata: true,
                    initBalance: 50000,
                    balance: -1000,
                    year: 2022,
                    month: 6,
                    target: 'Test',
                    isForwardBalance: true,
                  ),
                ),
            child: Text('初期データ追加'),
          ),
        ],
      ),
    );
  }
}

const _list = [
  MoneyConsumptionHistoryModel(
    year: 2021,
    month: 11,
    initBalance: 50000,
    remainedBalance: 1000,
  ),
  MoneyConsumptionHistoryModel(
    year: 2021,
    month: 12,
    initBalance: 50000,
    remainedBalance: 3000,
  ),
  MoneyConsumptionHistoryModel(
    year: 2022,
    month: 1,
    initBalance: 50000,
    remainedBalance: 0,
  ),
  MoneyConsumptionHistoryModel(
    year: 2022,
    month: 2,
    initBalance: 50000,
    remainedBalance: -1000,
  ),
  MoneyConsumptionHistoryModel(
    year: 2022,
    month: 3,
    initBalance: 50000,
    remainedBalance: 10000,
  ),
  MoneyConsumptionHistoryModel(
    year: 2022,
    month: 4,
    initBalance: 50000,
    remainedBalance: 1000,
  ),
  MoneyConsumptionHistoryModel(
    year: 2022,
    month: 5,
    initBalance: 50000,
    remainedBalance: 1000,
  ),
  MoneyConsumptionHistoryModel(
    year: 2022,
    month: 6,
    initBalance: 50000,
    remainedBalance: 1000,
  ),
  // MoneyConsumptionHistoryModel(
  //   year: 2022,
  //   month: 7,
  //   initBalance: 50000,
  //   remainedBalance: -3000,
  // ),
  // MoneyConsumptionHistoryModel(
  //   year: 2022,
  //   month: 8,
  //   initBalance: 50000,
  //   remainedBalance: 0,
  // ),
];
