// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_meter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoneyMeterModel _$$_MoneyMeterModelFromJson(Map<String, dynamic> json) =>
    _$_MoneyMeterModel(
      hasdata: json['hasdata'] as bool? ?? false,
      index: json['index'] as int? ?? 0,
      isCenterContent: json['isCenterContent'] as bool? ?? false,
      initBalance: json['initBalance'] as int? ?? 0,
      balance: json['balance'] as int? ?? 0,
      remainDays: json['remainDays'] as int? ?? 0,
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
      'index': instance.index,
      'isCenterContent': instance.isCenterContent,
      'initBalance': instance.initBalance,
      'balance': instance.balance,
      'remainDays': instance.remainDays,
      'isForwardBalance': instance.isForwardBalance,
      'moneyConsumptionHistoryModelList':
          instance.moneyConsumptionHistoryModelList,
    };
