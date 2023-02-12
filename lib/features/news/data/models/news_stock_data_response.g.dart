// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_stock_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsStockDataResponse _$NewsStockDataResponseFromJson(
        Map<String, dynamic> json) =>
    NewsStockDataResponse(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      industry: json['industry'] as String?,
      exchange: json['exchange'] as String,
      exchangeLong: json['exchange_long'] as String,
      country: json['country'] as String,
      matchScore: json['match_score'] as num,
      sentimentScore: json['sentiment_score'] as num,
    );

Map<String, dynamic> _$NewsStockDataResponseToJson(
        NewsStockDataResponse instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'type': instance.type,
      'industry': instance.industry,
      'exchange': instance.exchange,
      'exchange_long': instance.exchangeLong,
      'country': instance.country,
      'match_score': instance.matchScore,
      'sentiment_score': instance.sentimentScore,
    };
