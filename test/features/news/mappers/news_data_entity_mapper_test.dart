import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockdata/features/news/data/mappers/news_data_entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_data_response.dart';

import '../../../json/json_reader.dart';
import '../../../test_variables.dart';

void main() {
  test(
    'Should map news_response fixture to appropriate entity.',
    () async {
      final jsonMap = json.decode(readJsonString('news_response.json'));
      final response = NewsDataResponse.fromJson(jsonMap['data'][0]);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container.read(newsDataEntityMapperProvider)(response),
        testNewsData,
      );
    },
  );
}
