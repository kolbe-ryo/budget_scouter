// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_consumption_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoneyConsumptionHistoryModel _$$_MoneyConsumptionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_MoneyConsumptionHistoryModel(
      year: json['year'] as String? ?? '',
      month: json['month'] as String? ?? '',
      initBalance: json['initBalance'] as int? ?? 0,
      remainedBalance: json['remainedBalance'] as int? ?? 0,
    );

Map<String, dynamic> _$$_MoneyConsumptionHistoryModelToJson(
        _$_MoneyConsumptionHistoryModel instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'initBalance': instance.initBalance,
      'remainedBalance': instance.remainedBalance,
    };
