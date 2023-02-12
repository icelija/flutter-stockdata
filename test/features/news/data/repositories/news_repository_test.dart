import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_response.dart';
import 'package:stockdata/features/news/data/repositories/news_repository.dart';
import 'package:stockdata/features/news/domain/entities/news_entity.dart';

//ignore: prefer-match-file-name
class MockApiClient extends Mock implements ApiClient {}

void main() {
  late ApiClient apiClient;

  late NewsRepository newsRepository;
  late EntityMapper<NewsEntity, NewsResponse> newsEntityMapper;
  setUp(() {
    apiClient = MockApiClient();
    //newsEntityMapper = MockNewsEntityMapper();

    // newsRepository = NewsRepositoryImpl(
    //   apiClient,
    //   newsEntityMapper,
    // );
  });

  group(' getNews()', () {
    test('executes success flow', () async {
      // final value = newsRepository. getNews();
      //expect(value, equals(smth));
    });

    test('executes failure flow', () async {
      // final value = newsRepository. getNews();
      //expect(value, equals(smth));
    });
  });
}
