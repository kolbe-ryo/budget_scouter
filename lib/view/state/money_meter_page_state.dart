// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../model/money_meter_model.dart';
import 'go_back_state.dart';

part 'money_meter_page_state.freezed.dart';

@freezed
class MoneyMeterPageState with _$MoneyMeterPageState {
  factory MoneyMeterPageState({
    @Default(MoneyMeterModel()) MoneyMeterModel moneyMeterModel,
    @Default(GoBackState()) GoBackState goBackState,
  }) = _MoneyMeterPageState;
}