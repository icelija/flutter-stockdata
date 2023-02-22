// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockData _$StockDataFromJson(Map<String, dynamic> json) => StockData(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      industry: json['industry'] as String?,
      exchange: json['exchange'] as String,
      exchangeLong: json['exchangeLong'] as String,
      micCode: json['micCode'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$StockDataToJson(StockData instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'type': instance.type,
      'industry': instance.industry,
      'exchange': instance.exchange,
      'exchangeLong': instance.exchangeLong,
      'micCode': instance.micCode,
      'country': instance.country,
    };
