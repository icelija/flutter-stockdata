import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/common/data/mappers/meta_data_entity_mapper.dart';
import 'package:stockdata/features/news/data/mappers/news_data_entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_response.dart';
import 'package:stockdata/features/news/domain/entities/news_entity.dart';

final newsEntityMapperProvider =
    Provider<EntityMapper<NewsEntity, NewsResponse>>(
  (ref) => (response) {
    final metaDataEntityMapper = ref.watch(metaDataEntityMapperProvider);
    final newsDataEntityMapper = ref.watch(newsDataEntityMapperProvider);
    return NewsEntity(
      metaData: metaDataEntityMapper(response.metaDataResponse),
      newsData: response.newsDataResponse
          .map((newsDataResponse) => newsDataEntityMapper(newsDataResponse))
          .toList(),
    );
  },
);
