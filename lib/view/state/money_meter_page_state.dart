import 'package:budget_scouter/model/money_meter_model.dart';
import 'package:budget_scouter/view/state/go_back_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'money_meter_page_state.freezed.dart';

@freezed
class MoneyMeterPageState with _$MoneyMeterPageState {
  factory MoneyMeterPageState({
    @Default(MoneyMeterModel()) MoneyMeterModel moneyMeterModel,
    @Default(GoBackState()) GoBackState goBackState,
  }) = _MoneyMeterPageState;
}
