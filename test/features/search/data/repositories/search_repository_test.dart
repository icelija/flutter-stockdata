import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/common/data/repositories/local_storage_repository.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/data/repositories/search_repository.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';
import 'package:stockdata/generated/l10n.dart';

import '../../../../test_variables.dart';

//ignore: prefer-match-file-name
class MockApiClient extends Mock implements ApiClient {}

class MockLocalStorageRepository extends Mock
    implements LocalStorageRepository {}

SearchEntity mockSearchEntityMapper(EntitySearchResponse _) => testSearchEntity;

void main() {
  late ApiClient apiClient;
  late EntityMapper<SearchEntity, EntitySearchResponse> searchEntityMapper;
  late LocalStorageRepository localStorageRepository;

  late SearchRepository searchRepository;

  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    apiClient = MockApiClient();
    searchEntityMapper = mockSearchEntityMapper;
    localStorageRepository = MockLocalStorageRepository();

    searchRepository = SearchRepositoryImpl(
      apiClient,
      searchEntityMapper,
      localStorageRepository,
    );
  });

  group('search({String query = ' ', int page = 1})', () {
    test('executes first page with empty query flow', () async {
      when(() => apiClient.searchEntities(any(), 1))
          .thenAnswer((_) async => testSearchResponse);
      when(() => localStorageRepository.getSearchData())
          .thenAnswer((_) async => testSearchEntity);
      when(() => localStorageRepository.setSearchData(
          searchEntity: testSearchEntity)).thenAnswer((_) async => {});
      await for (final value in searchRepository.search(page: 1, query: '')) {
        expect(value, const Right(testSearchEntity));
      }
      verify(() => localStorageRepository.getSearchData());
      verify(() =>
          localStorageRepository.setSearchData(searchEntity: testSearchEntity));
    });

    test('executes first page with set query flow', () async {
      when(() => apiClient.searchEntities(any(), 1))
          .thenAnswer((_) async => testSearchResponse);
      await for (final value
          in searchRepository.search(page: 1, query: 'Test')) {
        expect(value, const Right(testSearchEntity));
      }
      verifyNever(() => localStorageRepository.getSearchData());
      verifyNever(() =>
          localStorageRepository.setSearchData(searchEntity: testSearchEntity));
    });

    test('executes second page with empty query flow', () async {
      when(() => apiClient.searchEntities(any(), 2))
          .thenAnswer((_) async => testSearchResponse);
      await for (final value in searchRepository.search(page: 2, query: '')) {
        expect(value, const Right(testSearchEntity));
      }
      verifyNever(() => localStorageRepository.getSearchData());
      verifyNever(() =>
          localStorageRepository.setSearchData(searchEntity: testSearchEntity));
    });

    final testException = Exception();

    test('executes failure flow', () async {
      when(() => apiClient.searchEntities(any(), 1)).thenThrow(testException);
      when(() => localStorageRepository.getSearchData())
          .thenAnswer((_) async => testSearchEntity);
      await for (final value in searchRepository.search()) {
        value.fold((l) => expect(l.error, testException), (r) => null);
      }
    });

    test('make sure provider returns same repository instance', () async {
      final providerContainer = ProviderContainer(overrides: [
        localStorageProvider.overrideWith((_) => localStorageRepository),
      ]);
      final value = providerContainer.read(searchRepositoryProvider);
      final value2 = providerContainer.read(searchRepositoryProvider);
      expect(value, value2);
    });
  });
}
