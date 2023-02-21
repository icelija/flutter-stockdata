import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_response.dart';
import 'package:stockdata/features/news/data/repositories/news_repository.dart';
import 'package:stockdata/features/news/domain/entities/news_entity.dart';
import 'package:stockdata/generated/l10n.dart';

import '../../../../test_variables.dart';

//ignore: prefer-match-file-name
class MockApiClient extends Mock implements ApiClient {}

NewsEntity mockSearchEntityMapper(NewsResponse _) => testNewsEntity;

void main() {
  late ApiClient apiClient;

  late NewsRepository newsRepository;
  late EntityMapper<NewsEntity, NewsResponse> newsEntityMapper;
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    apiClient = MockApiClient();
    newsEntityMapper = mockSearchEntityMapper;

    newsRepository = NewsRepositoryImpl(
      apiClient,
      newsEntityMapper,
    );
  });

  group(' getNews()', () {
    test('executes success flow', () async {
      when(() => apiClient.getNews(any(), 1))
          .thenAnswer((_) async => testNewsResponse);
      final value = await newsRepository.getNews(page: 1, query: '');
      expect(value, Right(testNewsEntity));
    });

    final testException = Exception();

    test('executes failure flow', () async {
      when(() => apiClient.getNews(any(), 1)).thenThrow(testException);
      final value = await newsRepository.getNews(query: '', page: 1);
      value.fold((l) => expect(l.error, testException), (r) => null);
    });

    test('executes failure flow', () async {
      final providerContainer = ProviderContainer();
      final value = providerContainer.read(newsRepositoryProvider);
      final value2 = providerContainer.read(newsRepositoryProvider);
      expect(value, value2);
    });
  });
}
