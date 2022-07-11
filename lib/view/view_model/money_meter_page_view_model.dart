// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../../model/money_meter_model_list.dart';
import '../../service/shared_preference_service.dart';

class MoneyMeterPageViewModel extends StateNotifier<MoneyMeterModelList> {
  MoneyMeterPageViewModel() : super(const MoneyMeterModelList());

  final SharedPreferenceService _storage = SharedPreferenceService(SharedPreferences.getInstance());

  // Fetch list from SharedPreference
  Future<void> fetch() async {
    final moneyMeterModelList = await _storage.fetch();
    state = moneyMeterModelList ?? state;
  }

  // Save state to SharedPreference
  Future<void> save(MoneyMeterModelList moneyMeterModelList) async {
    await _storage.save(moneyMeterModelList);
  }

  // Switch items index by tapping
  void switchId(int index) {}
}
