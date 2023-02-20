import 'package:stockdata/common/data/model/meta_data_response.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/data/models/stock_data_response.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';
import 'package:stockdata/features/search/domain/entities/stock_data.dart';

const testMetaData = MetaData(
  page: 1,
  returned: 2,
  limit: 2,
  found: 4,
);

const testStockData = StockData(
    symbol: 'MOV.NZ',
    name: 'Move Logistics Group Ltd',
    type: 'equity',
    exchange: 'NZX',
    exchangeLong: 'New Zealand Stock Exchange',
    micCode: 'XNZE',
    country: 'nz');

const testStockData2 = StockData(
    symbol: '^NZSCG',
    name: 'NEW ZEALAND EXCH NZSX SCI GR IDX',
    type: 'index',
    exchange: 'NZX',
    exchangeLong: 'New Zealand Stock Exchange',
    micCode: 'XNZE',
    country: 'nz');

const testSearchEntity = SearchEntity(metaData: testMetaData, stocksData: [
  testStockData,
  StockData(
      symbol: '^NZSCG',
      name: 'NEW ZEALAND EXCH NZSX SCI GR IDX',
      type: 'index',
      exchange: 'NZX',
      exchangeLong: 'New Zealand Stock Exchange',
      micCode: 'XNZE',
      country: 'nz'),
]);

const testSearchEntity2 = SearchEntity(
    metaData: MetaData(
      page: 2,
      returned: 2,
      limit: 2,
      found: 4,
    ),
    stocksData: [
      StockData(
          symbol: 'MORC.NZ',
          name: 'S&P/NZX Morrison Index',
          type: 'index',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
      StockData(
          symbol: 'DGC.NZ',
          name: 'DGL Group Ltd',
          type: 'equity',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
    ]);

const testSearchResponse = EntitySearchResponse(
    metaDataResponse: MetaDataResponse(
      page: 1,
      returned: 2,
      limit: 2,
      found: 4,
    ),
    stocksDataResponse: [
      StockDataResponse(
          symbol: 'MOV.NZ',
          name: 'Move Logistics Group Ltd',
          type: 'equity',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
      StockDataResponse(
          symbol: '^NZSCG',
          name: 'NEW ZEALAND EXCH NZSX SCI GR IDX',
          type: 'index',
          exchange: 'NZX',
          exchangeLong: 'New Zealand Stock Exchange',
          micCode: 'XNZE',
          country: 'nz'),
    ]);
