// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../enum/currency_data_enum.dart';
import 'money_consumption_history_model.dart';

part 'money_meter_model.freezed.dart';
part 'money_meter_model.g.dart';

@freezed
class MoneyMeterModel with _$MoneyMeterModel {
  const MoneyMeterModel._();

  const factory MoneyMeterModel({
    @Default(false) bool hasdata,
    @Default('') String target,
    @Default(0) int initBalance,
    @Default(0) int balance,
    @Default(CurrencyDataEnum.dollar) CurrencyDataEnum currency,
    @Default(true) isForwardBalance,
    @Default('') String createdAt,
    @Default(<MoneyConsumptionHistoryModel>[]) List<MoneyConsumptionHistoryModel> moneyConsumptionHistoryModelList,
  }) = _MoneyMeterModel;

  factory MoneyMeterModel.fromJson(Map<String, dynamic> json) => _$MoneyMeterModelFromJson(json);

  String get balanceRatio {
    try {
      return (((balance / initBalance) * 100).ceil()).toString();
    } catch (error) {
      return 0.toString();
    }
  }
}
