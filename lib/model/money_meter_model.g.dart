// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_meter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoneyMeterModel _$$_MoneyMeterModelFromJson(Map<String, dynamic> json) =>
    _$_MoneyMeterModel(
      hasdata: json['hasdata'] as bool? ?? false,
      target: json['target'] as String? ?? '',
      initBalance: json['initBalance'] as int? ?? 0,
      balance: json['balance'] as int? ?? 0,
      remainDays: json['remainDays'] as int? ?? 0,
      currency:
          $enumDecodeNullable(_$CurrencyDataEnumEnumMap, json['currency']) ??
              CurrencyDataEnum.dollar,
      isForwardBalance: json['isForwardBalance'] ?? false,
      moneyConsumptionHistoryModelList:
          (json['moneyConsumptionHistoryModelList'] as List<dynamic>?)
                  ?.map((e) => MoneyConsumptionHistoryModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const <MoneyConsumptionHistoryModel>[],
    );

Map<String, dynamic> _$$_MoneyMeterModelToJson(_$_MoneyMeterModel instance) =>
    <String, dynamic>{
      'hasdata': instance.hasdata,
      'target': instance.target,
      'initBalance': instance.initBalance,
      'balance': instance.balance,
      'remainDays': instance.remainDays,
      'currency': _$CurrencyDataEnumEnumMap[instance.currency]!,
      'isForwardBalance': instance.isForwardBalance,
      'moneyConsumptionHistoryModelList':
          instance.moneyConsumptionHistoryModelList,
    };

const _$CurrencyDataEnumEnumMap = {
  CurrencyDataEnum.dollar: 0,
  CurrencyDataEnum.euro: 1,
  CurrencyDataEnum.yen: 2,
  CurrencyDataEnum.sterling: 3,
};
