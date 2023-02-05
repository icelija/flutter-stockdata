import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/search/data/models/stock_data_response.dart';
import 'package:stockdata/features/search/domain/entities/stock_data.dart';

final stockDataEntityMapperProvider =
    Provider<EntityMapper<StockData, StockDataResponse>>(
  (ref) => (response) {
    return StockData(
      type: response.type,
      country: response.country,
      exchange: response.exchange,
      exchangeLong: response.exchangeLong,
      micCode: response.micCode,
      name: response.name,
      symbol: response.symbol,
      industry: response.industry,
    );
  },
);
