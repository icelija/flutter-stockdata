import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/data/repositories/search_repository.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';
import 'package:stockdata/generated/l10n.dart';

import '../../../../test_variables.dart';

//ignore: prefer-match-file-name
class MockApiClient extends Mock implements ApiClient {}

SearchEntity mockSearchEntityMapper(EntitySearchResponse _) => testSearchEntity;

void main() {
  late ApiClient apiClient;
  late EntityMapper<SearchEntity, EntitySearchResponse> searchEntityMapper;

  late SearchRepository searchRepository;

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    apiClient = MockApiClient();
    searchEntityMapper = mockSearchEntityMapper;

    searchRepository = SearchRepositoryImpl(
      apiClient,
      searchEntityMapper,
    );
  });

  group('search({String query = ' ', int page = 1})', () {
    test('executes success flow', () async {
      when(() => apiClient.searchEntities(any(), 1))
          .thenAnswer((_) async => testSearchResponse);
      final value = await searchRepository.search(page: 1, query: '');
      expect(value, const Right(testSearchEntity));
    });

    final testException = Exception();

    test('executes failure flow', () async {
      when(() => apiClient.searchEntities(any(), 1)).thenThrow(testException);
      final value = await searchRepository.search(query: '', page: 1);
      value.fold((l) => expect(l.error, testException), (r) => null);
    });

    test('executes failure flow', () async {
      final providerContainer = ProviderContainer();
      final value = providerContainer.read(searchRepositoryProvider);
      final value2 = providerContainer.read(searchRepositoryProvider);
      expect(value, value2);
    });
  });
}
