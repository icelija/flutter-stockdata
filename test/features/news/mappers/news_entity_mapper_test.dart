import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockdata/common/data/mappers/meta_data_entity_mapper.dart';
import 'package:stockdata/common/data/models/meta_data_response.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';
import 'package:stockdata/features/news/data/mappers/news_entity_mapper.dart';
import 'package:stockdata/features/news/data/mappers/news_stock_data_entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_response.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../test_variables.dart';

void main() {
  test(
    'Should map entity_search_response fixture to appropriate entity.',
    () async {
      final jsonMap = json.decode(fixture('news_response.json'));
      final response = NewsResponse.fromJson(jsonMap);

      final container = ProviderContainer(
        overrides: [
          metaDataEntityMapperProvider
              .overrideWithValue(_mockMetaDataEntityMapper),
          newsStockDataEntityMapperProvider
              .overrideWithValue((_) => testNewsStockData),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(newsEntityMapperProvider)(response),
        testNewsEntity,
      );
    },
  );
}

MetaData _mockMetaDataEntityMapper(MetaDataResponse _) => testMetaData;
