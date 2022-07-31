// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'money_consumption_history_model.freezed.dart';
part 'money_consumption_history_model.g.dart';

@freezed
class MoneyConsumptionHistoryModel with _$MoneyConsumptionHistoryModel {
  const MoneyConsumptionHistoryModel._();

  const factory MoneyConsumptionHistoryModel({
    @Default('') String createdAt,
    @Default(0) int initBalance,
    @Default(0) int remainedBalance,
  }) = _MoneyConsumptionHistoryModel;

  factory MoneyConsumptionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$MoneyConsumptionHistoryModelFromJson(json);
}
