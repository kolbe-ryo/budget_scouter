// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../model/money_meter_model.dart';
import '../../service/shared_preference_service.dart';
import '../page/top_page.dart';

class MoneyMeterPageViewModel extends StateNotifier<MoneyMeterModel> {
  MoneyMeterPageViewModel() : super(const MoneyMeterModel());

  final SharedPreferenceService _storage = SharedPreferenceService(SharedPreferences.getInstance());

  // Fetch list from SharedPreference
  Future<bool> fetch() async {
    final moneyMeterModel = await _storage.fetch();
    state = moneyMeterModel ?? state;
    return true;
  }

  // Save state to SharedPreference
  Future<void> save(MoneyMeterModel moneyMeterModel) async {
    state = moneyMeterModel.copyWith(hasdata: true);
    await _storage.save(state);
  }

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
    // return '';
  }
}
