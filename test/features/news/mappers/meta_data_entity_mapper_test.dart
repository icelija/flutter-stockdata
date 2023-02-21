import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockdata/common/data/mappers/meta_data_entity_mapper.dart';
import 'package:stockdata/common/data/model/meta_data_response.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../test_variables.dart';

void main() {
  test(
    'Should map news_response fixture to appropriate entity.',
    () async {
      final jsonMap = json.decode(fixture('news_response.json'));
      final response = MetaDataResponse.fromJson(jsonMap['meta']);

      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(
        container.read(metaDataEntityMapperProvider)(response),
        testMetaData,
      );
    },
  );
}
