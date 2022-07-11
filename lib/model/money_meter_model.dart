// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'money_consumption_history_model.dart';

part 'money_meter_model.freezed.dart';
part 'money_meter_model.g.dart';

@freezed
class MoneyMeterModel with _$MoneyMeterModel {
  const MoneyMeterModel._();

  const factory MoneyMeterModel({
    @Default(0) int index,
    @Default(false) bool isCenterContent,
    @Default(0) int initBalance,
    @Default(0) int balance,
    @Default(0) int remainDays,
    @Default(false) isForwardBalance,
    @Default(<MoneyConsumptionHistoryModel>[]) List<MoneyConsumptionHistoryModel> moneyConsumptionHistoryModelList,
  }) = _MoneyMeterModel;

  factory MoneyMeterModel.fromJson(Map<String, dynamic> json) => _$MoneyMeterModelFromJson(json);

  int get balanceRatio => (balance / initBalance).ceil();
}
