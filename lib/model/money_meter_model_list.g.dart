// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_meter_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoneyMeterModelList _$$_MoneyMeterModelListFromJson(
        Map<String, dynamic> json) =>
    _$_MoneyMeterModelList(
      moneyMeterModelList: (json['moneyMeterModelList'] as List<dynamic>?)
              ?.map((e) => MoneyMeterModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <MoneyMeterModel>[],
    );

Map<String, dynamic> _$$_MoneyMeterModelListToJson(
        _$_MoneyMeterModelList instance) =>
    <String, dynamic>{
      'moneyMeterModelList': instance.moneyMeterModelList,
    };
