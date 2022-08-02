// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../model/money_consumption_history_model.dart';
import '../../model/money_meter_model.dart';
import '../../service/shared_preference_service.dart';
import '../../util/number_formatter.dart';
import '../state/go_back_state.dart';
import '../state/money_meter_page_state.dart';

class MoneyMeterPageViewModel extends StateNotifier<MoneyMeterPageState> {
  MoneyMeterPageViewModel() : super(MoneyMeterPageState());

  final SharedPreferenceService _storage = SharedPreferenceService(SharedPreferences.getInstance());

  // Fetch list from SharedPreference
  Future<MoneyMeterModel> fetch() async {
    final moneyMeterModel = await _storage.fetch();
    state = state.copyWith(moneyMeterModel: moneyMeterModel ?? state.moneyMeterModel);
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
    state = state.copyWith(moneyMeterModel: state.moneyMeterModel.copyWith(balance: remaining));
    await _storage.save(state.moneyMeterModel);
  }

  // Update model
  Future<void> update(dynamic object) async {}

  // Update model (from setting)
  Future<void> updateSetting(dynamic object) async {}

  // Update GoBack state
  Future<void> updateGoBack(bool? isBack) async {
    final memorizedMoney = state.goBackState.memorizedValue;

    if (isBack == null) {
      state = state.copyWith(
        goBackState: GoBackState(
          canBack: true,
          canGo: false,
          memorizedValue: state.moneyMeterModel.balance,
        ),
      );
      return;
    }

    // バックボタン押下
    if (isBack) {
      state = state.copyWith(
        goBackState: GoBackState(
          canBack: false,
          canGo: true,
          memorizedValue: state.moneyMeterModel.balance,
        ),
      );
    }

    // ゴーボタン押下
    if (!isBack) {
      state = state.copyWith(
        goBackState: GoBackState(
          canBack: true,
          canGo: false,
          memorizedValue: state.moneyMeterModel.balance,
        ),
      );
    }
    state = state.copyWith(
      moneyMeterModel: state.moneyMeterModel.copyWith(balance: memorizedMoney),
    );
    save(state.moneyMeterModel);
  }

  // Initiate model on first of month
  void _initOnFirstDate() {
    final nowDateTime = DateTime.now();
    final createdAtYM = NumberFormatter.createdAtFotmat(state.moneyMeterModel.year, state.moneyMeterModel.month);

    // 同じcreatedAtの場合処理しない
    if (nowYM == createdAtYM) {
      return;
    }

    List<MoneyConsumptionHistoryModel> historyList = [];

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
    }
    // 一ヶ月以上使用していなかった場合は以下の処理
    else {
      final preMonth = state.moneyMeterModel.moneyConsumptionHistoryModelList.last.month;
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
        ? state.moneyMeterModel.initBalance + state.moneyMeterModel.balance
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
