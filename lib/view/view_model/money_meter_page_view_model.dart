// Package imports:
import 'package:budget_scouter/model/money_meter_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../service/shared_preference_service.dart';

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
    await _storage.save(moneyMeterModel);
  }

  // Switch items index by tapping
  void switchId(int index) {}
}
