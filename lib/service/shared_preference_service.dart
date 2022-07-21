// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:budget_scouter/model/money_meter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../constant/constant_letter.dart';
import '../interface/shared_preference_interfage.dart';

class SharedPreferenceService implements SharedPreferenceInterface {
  SharedPreferenceService(this._storage);

  final Future<SharedPreferences> _storage;

  @override
  Future<MoneyMeterModel?> fetch() async {
    final storage = await _storage;
    if (!storage.containsKey(kStorageKey)) {
      return null;
    }
    final String? value = storage.getString(kStorageKey);
    return value != null ? MoneyMeterModel.fromJson(json.decode(value)) : null;
  }

  @override
  Future<void> save(MoneyMeterModel value) async {
    final storage = await _storage;
    final savingItem = json.encode(value.toJson());
    if (storage.containsKey(kStorageKey)) {
      await storage.setString(kStorageKey, savingItem);
    }
    return;
  }
}
