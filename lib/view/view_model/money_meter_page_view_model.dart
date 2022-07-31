// Flutter imports:
import 'package:budget_scouter/model/money_consumption_history_model.dart';
import 'package:budget_scouter/util/number_formatter.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../model/money_meter_model.dart';
import '../../service/shared_preference_service.dart';

class MoneyMeterPageViewModel extends StateNotifier<MoneyMeterModel> {
  MoneyMeterPageViewModel() : super(const MoneyMeterModel());

  final SharedPreferenceService _storage = SharedPreferenceService(SharedPreferences.getInstance());

  // Fetch list from SharedPreference
  Future<MoneyMeterModel> fetch() async {
    final moneyMeterModel = await _storage.fetch();
    state = moneyMeterModel ?? state;
    _initDateTime();
    return state;
  }

  // Save state to SharedPreference
  Future<void> save(MoneyMeterModel moneyMeterModel) async {
    state = moneyMeterModel;
    await _storage.save(state);
  }

  // Delete state to SharedPreference
  Future<void> delete(BuildContext context) async {
    await _storage.delete();
    state = const MoneyMeterModel();
  }

  // Use money
  Future<void> use(int money) async {
    final remaining = state.balance - money;
    state = state.copyWith(balance: remaining);
    await _storage.save(state);
  }

  // Update model
  Future<void> update(dynamic object) async {}

  // Initiate model on first of month
  void _initDateTime() {
    // 同じcreatedAtの場合処理しない
    final nowDateTime = DateTime.now();
    final createdAtYM = NumberFormatter.createdAtFotmat(state.year, state.month);
    if (nowYM == createdAtYM || state.moneyConsumptionHistoryModelList.isEmpty) {
      return;
    }

    List<MoneyConsumptionHistoryModel> historyList = [];
    // modelが前月だった場合
    if ((nowDateTime.month - 1) == state.month) {
      // Generate history
      historyList.add(MoneyConsumptionHistoryModel(
        year: nowDateTime.year,
        month: nowDateTime.month,
      ));
    } else {
      final preMonth = state.moneyConsumptionHistoryModelList.last.month;
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
    final balance = state.isForwardBalance ? state.initBalance - state.balance : state.initBalance;

    state = state.copyWith(
      balance: balance,
      year: nowDateTime.year,
      month: nowDateTime.month,
      moneyConsumptionHistoryModelList: [...state.moneyConsumptionHistoryModelList, ...historyList],
    );
    save(state);
    return;
  }

  // Go back to previous value
  Future<void> goBack() async {}

  String get remainDays {
    final now = DateTime.now();
    final elapsedDay = DateTime(now.year, now.month, now.day).day;
    final dayMonth = DateTime(now.year, now.month + 1, 1).add(const Duration(days: -1)).day;
    final remainDays = dayMonth - elapsedDay + 1;
    return remainDays != 1 ? '$remainDays Days' : '$remainDays Day';
  }

  String get nowYM {
    final DateTime dateTime = DateTime.now();
    return '${dateTime.year}-${dateTime.month}';
  }
}
