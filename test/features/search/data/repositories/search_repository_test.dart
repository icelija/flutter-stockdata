import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/data/repositories/search_repository.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';

//ignore: prefer-match-file-name
class MockApiClient extends Mock implements ApiClient {}

void main() {
  late ApiClient apiClient;
  late EntityMapper<SearchEntity, EntitySearchResponse> searchEntityMapper;

  late SearchRepository searchRepository;

  setUp(() {
    apiClient = MockApiClient();
    //searchEntityMapper = MockSearchEntityMapper();

    //searchRepository = SearchRepositoryImpl(apiClient, searchEntityMapper,);
  });

  group(' search({String query = &quot;&quot;, int page = 1})', () {
    test('executes success flow', () async {
      // final value = searchRepository. search({String query = &quot;&quot;, int page = 1});
      //expect(value, equals(smth));
    });

    test('executes failure flow', () async {
      // final value = searchRepository. search({String query = &quot;&quot;, int page = 1});
      //expect(value, equals(smth));
    });
  });
}
