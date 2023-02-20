import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockdata/common/data/mappers/meta_data_entity_mapper.dart';
import 'package:stockdata/common/data/model/meta_data_response.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';
import 'package:stockdata/features/search/data/mappers/search_entity_mapper.dart';
import 'package:stockdata/features/search/data/mappers/stock_data_entity_mapper.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_variables.dart';

void main() {
  test(
    'Should map entity_search_response fixture to appropriate entity.',
    () async {
      final jsonMap = json.decode(fixture('entity_search_response.json'));
      final response = EntitySearchResponse.fromJson(jsonMap);

      final container = ProviderContainer(
        overrides: [
          metaDataEntityMapperProvider
              .overrideWithValue(_mockMetaDataEntityMapper),
          stockDataEntityMapperProvider.overrideWithValue((p0) =>
              p0.symbol == testStockData.symbol
                  ? testStockData
                  : testStockData2),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(searchEntityMapperProvider)(response),
        testSearchEntity,
      );
    },
  );
}

MetaData _mockMetaDataEntityMapper(MetaDataResponse _) => testMetaData;
