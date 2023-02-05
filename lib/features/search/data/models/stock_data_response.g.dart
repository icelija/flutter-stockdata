// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockDataResponse _$StockDataResponseFromJson(Map<String, dynamic> json) =>
    StockDataResponse(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      industry: json['industry'] as String?,
      exchange: json['exchange'] as String,
      exchangeLong: json['exchange_long'] as String,
      micCode: json['mic_code'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$StockDataResponseToJson(StockDataResponse instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'type': instance.type,
      'industry': instance.industry,
      'exchange': instance.exchange,
      'exchange_long': instance.exchangeLong,
      'mic_code': instance.micCode,
      'country': instance.country,
    };
