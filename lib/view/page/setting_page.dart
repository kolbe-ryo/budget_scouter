// Flutter imports:
import 'package:budget_scouter/view/common/setting_tile.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../model/money_consumption_history_model.dart';
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
            onTap: () async => null,
          ),
          SettingTile(
            title: 'リセット',
            icon: Icons.delete,
            onTap: () => null,
          ),
          SettingTile(
            title: 'このアプリについて',
            icon: Icons.app_registration,
            onTap: () => null,
          ),
          ElevatedButton(
            onPressed: () => ref.read(moneyMeterProvider.notifier).delete(context),
            child: Text('削除'),
          ),
          ElevatedButton(
            onPressed: () =>
                ref.read(moneyMeterProvider.notifier).save(model.copyWith(moneyConsumptionHistoryModelList: _list)),
            child: Text('履歴追加'),
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
