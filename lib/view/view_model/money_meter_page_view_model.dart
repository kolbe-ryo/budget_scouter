// Flutter imports:
import 'package:budget_scouter/model/money_consumption_history_model.dart';
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
    _updateMonth();
    final moneyMeterModel = await _storage.fetch();
    state = moneyMeterModel ?? state;
    return state;
  }

  void _updateMonth() {
    // TODO: 現在の日時とmodel内の日時を比較し、異なる場合に処理する
    // 前月だった場合、
    // 前々月などだった場合
    if (false) {
      // Reset or not balannce
      final balance = state.isForwardBalance ? state.initBalance - state.balance : state.initBalance;

      // Generate history
      final lastMonthHistoryModel = MoneyConsumptionHistoryModel(
        createdAt: state.createdAt,
        initBalance: state.initBalance,
        remainedBalance: state.balance,
      );

      state = state.copyWith(
        balance: balance,
        createdAt: createdAtYM,
        moneyConsumptionHistoryModelList: [...state.moneyConsumptionHistoryModelList, lastMonthHistoryModel],
      );
      save(state);
    }
  }

  // Save state to SharedPreference
  Future<void> save(MoneyMeterModel moneyMeterModel) async {
    state = moneyMeterModel;
    await _storage.save(state);
  }

  // Use money
  Future<void> use(int money) async {
    final remaining = state.balance - money;
    state = state.copyWith(balance: remaining);
    await _storage.save(state);
  }

  // Go back to previous value
  Future<void> goBack() async {}

  // Delete state to SharedPreference
  Future<void> delete(BuildContext context) async {
    await _storage.delete();
    state = const MoneyMeterModel();
  }

  String get remainDays {
    final now = DateTime.now();
    final elapsedDay = DateTime(now.year, now.month, now.day).day;
    final dayMonth = DateTime(now.year, now.month, 0).day;
    final remainDays = dayMonth - elapsedDay + 1;
    return remainDays != 1 ? '$remainDays Days' : '$remainDays Day';
  }

  String get createdAtYM {
    final DateTime dateTime = DateTime.now();
    return '${dateTime.year}-${dateTime.month}';
  }
}
