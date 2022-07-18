// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'money_meter_model.dart';

part 'money_meter_model_list.freezed.dart';
part 'money_meter_model_list.g.dart';

@freezed
class MoneyMeterModelList with _$MoneyMeterModelList {
  const MoneyMeterModelList._();

  const factory MoneyMeterModelList({
    @Default(<MoneyMeterModel>[MoneyMeterModel()]) List<MoneyMeterModel> moneyMeterModelList,
  }) = _MoneyMeterModelList;

  factory MoneyMeterModelList.fromJson(Map<String, dynamic> json) => _$MoneyMeterModelListFromJson(json);
}
