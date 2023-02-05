import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/search/data/mappers/meta_data_entity_mapper.dart';
import 'package:stockdata/features/search/data/mappers/stock_data_entity_mapper.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';

final searchEntityMapperProvider =
    Provider<EntityMapper<SearchEntity, EntitySearchResponse>>(
  (ref) => (response) {
    final metaDataEntityMapper = ref.watch(metaDataEntityMapperProvider);
    final stockDataEntityMapper = ref.watch(stockDataEntityMapperProvider);
    return SearchEntity(
      metaData: metaDataEntityMapper(response.metaDataResponse),
      stocksData: response.stocksDataResponse
          .map((stockDataResponse) => stockDataEntityMapper(stockDataResponse))
          .toList(),
    );
  },
);
