// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../interface/shared_preference_interfage.dart';
import '../../model/money_consumption_history_model.dart';
import '../../model/money_meter_model.dart';
import '../../service/shared_preference_service.dart';
import '../../util/number_formatter.dart';
import '../state/money_meter_page_state.dart';

class MoneyMeterPageViewModel extends StateNotifier<MoneyMeterPageState> {
  MoneyMeterPageViewModel() : super(MoneyMeterPageState());

  final SharedPreferenceInterface _storage = SharedPreferenceService(SharedPreferences.getInstance());

  // Fetch list from SharedPreference
  Future<MoneyMeterModel> fetch() async {
    final moneyMeterModel = await _storage.fetch();
    state = state.copyWith(moneyMeterModel: moneyMeterModel ?? const MoneyMeterModel());
    _initOnFirstDate();
    return state.moneyMeterModel;
  }

  // Save state to SharedPreference
  Future<void> save(MoneyMeterModel moneyMeterModel) async {
    state = state.copyWith(moneyMeterModel: moneyMeterModel);
    await _storage.save(state.moneyMeterModel);
  }

  // Delete state to SharedPreference
  Future<void> delete(BuildContext context) async {
    await _storage.delete();
    state = MoneyMeterPageState();
  }

  // Use money
  Future<void> use(int money) async {
    final remaining = state.moneyMeterModel.balance - money;
    final currentHistory =
        state.moneyMeterModel.moneyConsumptionHistoryModelList.last.copyWith(remainedBalance: remaining);

    final historyList = state.moneyMeterModel.moneyConsumptionHistoryModelList;

    state = state.copyWith(
      moneyMeterModel: state.moneyMeterModel.copyWith(
        balance: remaining,
        moneyConsumptionHistoryModelList:
            historyList.asMap().entries.map((e) => e.key != historyList.length - 1 ? e.value : currentHistory).toList(),
      ),
    );
    await _storage.save(state.moneyMeterModel);
  }

  // Initiate model on first of month
  void _initOnFirstDate() {
    final nowDateTime = DateTime.now();

    // 初回のみ現在の年月を書き込む
    if (state.moneyMeterModel.year == 0) {
      state = state.copyWith(
        moneyMeterModel: state.moneyMeterModel.copyWith(
          year: nowDateTime.year,
          month: nowDateTime.month,
        ),
      );
    }

    final createdAtYM = NumberFormatter.createdAtFotmat(state.moneyMeterModel.year, state.moneyMeterModel.month);

    // 同じcreatedAtの場合処理しない
    if (nowYM == createdAtYM) {
      return;
    }

    List<MoneyConsumptionHistoryModel> historyList = [];
    int lastBalance = 0;

    // modelが前月だった場合
    if ((nowDateTime.month - 1) == state.moneyMeterModel.month) {
      historyList.add(
        MoneyConsumptionHistoryModel(
          year: nowDateTime.year,
          month: nowDateTime.month,
          initBalance: state.moneyMeterModel.initBalance,
          remainedBalance: state.moneyMeterModel.balance,
        ),
      );
      lastBalance = state.moneyMeterModel.balance;
    }
    // 一ヶ月以上使用していなかった場合は以下の処理
    else {
      int preMonth;
      if (state.moneyMeterModel.moneyConsumptionHistoryModelList.isEmpty) {
        preMonth = state.moneyMeterModel.month;
      } else {
        preMonth = state.moneyMeterModel.moneyConsumptionHistoryModelList.last.month;
      }
      // 現時点の前月から一月ずつ、前回最後に利用した月まで戻って空のhistoryを代入する
      for (int decreaseMonth = nowDateTime.month - 1; decreaseMonth != preMonth; decreaseMonth--) {
        // 戻った年月のDateTime
        final dateTime = DateTime(nowDateTime.year, decreaseMonth);
        historyList = [
          MoneyConsumptionHistoryModel(
            year: dateTime.year,
            month: dateTime.month,
          ),
          ...historyList
        ];
      }
    }

    // Reset or not balannce
    final balance = state.moneyMeterModel.isForwardBalance
        ? state.moneyMeterModel.initBalance + lastBalance
        : state.moneyMeterModel.initBalance;

    state = state.copyWith(
      moneyMeterModel: state.moneyMeterModel.copyWith(
        balance: balance,
        year: nowDateTime.year,
        month: nowDateTime.month,
        moneyConsumptionHistoryModelList: [...state.moneyMeterModel.moneyConsumptionHistoryModelList, ...historyList],
      ),
    );
    save(state.moneyMeterModel);
    return;
  }

  SharedPreferenceInterface get storage => _storage;

  String remainDays(BuildContext context) {
    final now = DateTime.now();
    final elapsedDay = DateTime(now.year, now.month, now.day).day;
    final dayMonth = DateTime(now.year, now.month + 1, 1).add(const Duration(days: -1)).day;
    final remainDays = dayMonth - elapsedDay + 1;
    return remainDays != 1
        ? '$remainDays ${AppLocalizations.of(context)!.days}'
        : '$remainDays ${AppLocalizations.of(context)!.days}';
  }

  String get nowYM {
    final DateTime dateTime = DateTime.now();
    return '${dateTime.year}-${dateTime.month}';
  }
}
