// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyOverviewModelImpl _$$CompanyOverviewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyOverviewModelImpl(
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      stockExchange: json['stockExchange'] as String?,
      exchangeShortName: json['exchangeShortName'] as String?,
    );

Map<String, dynamic> _$$CompanyOverviewModelImplToJson(
        _$CompanyOverviewModelImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'currency': instance.currency,
      'stockExchange': instance.stockExchange,
      'exchangeShortName': instance.exchangeShortName,
    };
