// Project imports:
import '../model/money_meter_model_list.dart';

abstract class SharedPreferenceInterface {
  // Fetch model list from shared preference
  MoneyMeterModelList? fetch();

  // Save model to shared preference
  Future<void> save(MoneyMeterModelList value);
}
