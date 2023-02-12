import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_stock_data_response.dart';
import 'package:stockdata/features/news/domain/entities/news_stock_data.dart';

final newsStockDataEntityMapperProvider =
    Provider<EntityMapper<NewsStockData, NewsStockDataResponse>>(
  (ref) => (response) {
    return NewsStockData(
      type: response.type,
      country: response.country,
      exchange: response.exchange,
      exchangeLong: response.exchangeLong,
      name: response.name,
      symbol: response.symbol,
      industry: response.industry,
      matchScore: response.matchScore,
      sentimentScore: response.sentimentScore,
    );
  },
);
