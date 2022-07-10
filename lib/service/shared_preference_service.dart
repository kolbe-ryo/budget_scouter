// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '../constant/constant_letter.dart';
import '../interface/shared_preference_interfage.dart';
import '../model/money_meter_model_list.dart';

class SharedPreferenceService implements SharedPreferenceInterface {
  SharedPreferenceService(this._storage);

  final SharedPreferences _storage;

  @override
  MoneyMeterModelList? fetch() {
    if (!_storage.containsKey(kStorageKey)) {
      return null;
    }
    final String? value = _storage.getString(kStorageKey);
    return value != null ? MoneyMeterModelList.fromJson(json.decode(value)) : null;
  }

  @override
  Future<void> save(MoneyMeterModelList value) async {
    final savingItem = json.encode(value.toJson());
    if (!_storage.containsKey(kStorageKey)) {
      return;
    }
    await _storage.setString(kStorageKey, savingItem);
    return;
  }
}
