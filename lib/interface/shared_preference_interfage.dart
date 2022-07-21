// Project imports:
import '../model/money_meter_model.dart';

abstract class SharedPreferenceInterface {
  // Fetch model list from shared preference
  Future<MoneyMeterModel?> fetch();

  // Save model to shared preference
  Future<void> save(MoneyMeterModel value);
}
