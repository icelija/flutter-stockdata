import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/news/data/mappers/news_stock_data_entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_data_response.dart';
import 'package:stockdata/features/news/domain/entities/news_data.dart';

final newsDataEntityMapperProvider =
    Provider<EntityMapper<NewsData, NewsDataResponse>>(
  (ref) => (response) {
    final newsStockDataEntityMapper =
        ref.watch(newsStockDataEntityMapperProvider);
    return NewsData(
      title: response.title,
      description: response.description,
      uuid: response.uuid,
      imageUrl: response.imageUrl,
      keywords: response.keywords,
      language: response.language,
      publishedOn: response.publishedOn,
      relevanceScore: response.relevanceScore,
      snippet: response.snippet,
      source: response.source,
      url: response.url,
      entities: response.entities
          .map((entity) => newsStockDataEntityMapper(entity))
          .toList(),
      similar: const [],
    );
  },
);
