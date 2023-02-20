import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockdata/features/search/data/mappers/stock_data_entity_mapper.dart';
import 'package:stockdata/features/search/data/models/stock_data_response.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_variables.dart';

void main() {
  test(
    'Should map entity_search_response fixture to appropriate entity.',
    () async {
      final jsonMap = json.decode(fixture('entity_search_response.json'));
      final response = StockDataResponse.fromJson(jsonMap['data'][0]);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container.read(stockDataEntityMapperProvider)(response),
        testStockData,
      );
    },
  );
}
