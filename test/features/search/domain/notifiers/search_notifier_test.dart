import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import 'package:stockdata/common/domain/entities/failure.dart';
import 'package:stockdata/features/search/data/repositories/search_repository.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';
import 'package:stockdata/features/search/domain/notifiers/search_notifier.dart';
import 'package:stockdata/features/search/domain/notifiers/search_state.dart';
import 'package:stockdata/generated/l10n.dart';

import '../../../../test_variables.dart';

//ignore: prefer-match-file-name
class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  late SearchRepository searchRepository;

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    searchRepository = MockSearchRepository();
  });

  ProviderContainer getProviderContainer() => ProviderContainer(overrides: [
        searchNotifierProvider
            .overrideWith((ref) => SearchNotifier(searchRepository)),
      ]);

  group('search({bool firstFetch = true, String query = ' '})', () {
    stateNotifierTest<SearchNotifier, SearchState>(
      'executes first fetch successfully',
      build: () => getProviderContainer().read(searchNotifierProvider.notifier),
      setUp: () {
        when(() => searchRepository.search(page: 1, query: '')).thenAnswer(
          (_) => Stream<Either<Failure, SearchEntity>>.fromIterable(
              [const Right(testSearchEntity), const Right(testSearchEntity)]),
        );
      },
      actions: (stateNotifier) async {
        await stateNotifier.search();
      },
      expect: () => [
        const SearchState.loading(null),
        const SearchState.loaded(testSearchEntity),
        const SearchState.loaded(testSearchEntity),
      ],
    );

    stateNotifierTest<SearchNotifier, SearchState>(
      'executes multiple first fetch to test no same calls go through',
      build: () => getProviderContainer().read(searchNotifierProvider.notifier),
      setUp: () {
        when(() => searchRepository.search(page: 1, query: '')).thenAnswer(
          (_) => Stream<Either<Failure, SearchEntity>>.fromIterable(
              [const Right(testSearchEntity), const Right(testSearchEntity)]),
        );
      },
      actions: (stateNotifier) async {
        await Future.wait([stateNotifier.search(), stateNotifier.search()]);
      },
      expect: () => [
        const SearchState.loading(null),
        const SearchState.loaded(testSearchEntity),
        const SearchState.loaded(testSearchEntity),
      ],
    );

    stateNotifierTest<SearchNotifier, SearchState>(
      'executes first and seconds fetch successfully',
      build: () => getProviderContainer().read(searchNotifierProvider.notifier),
      setUp: () {
        when(() => searchRepository.search(page: 1, query: '')).thenAnswer(
          (_) => Stream<Either<Failure, SearchEntity>>.fromIterable(
              [const Right(testSearchEntity), const Right(testSearchEntity)]),
        );
        when(() => searchRepository.search(page: 2, query: '')).thenAnswer(
            (_) => Stream<Either<Failure, SearchEntity>>.fromIterable(
                [const Right(testSearchEntity2)]));
      },
      actions: (stateNotifier) async {
        await stateNotifier.search();
        await stateNotifier.search(firstFetch: false);
      },
      expect: () => [
        const SearchState.loading(null),
        const SearchState.loaded(testSearchEntity),
        const SearchState.loaded(testSearchEntity),
        const SearchState.loading(testSearchEntity),
        SearchState.loaded(testSearchEntity2.copyWith(
            stocksData:
                testSearchEntity.stocksData + testSearchEntity2.stocksData)),
      ],
    );

    stateNotifierTest<SearchNotifier, SearchState>(
      'executes first fetch and fails',
      build: () => getProviderContainer().read(searchNotifierProvider.notifier),
      setUp: () {
        when(() => searchRepository.search()).thenAnswer((_) =>
            Stream<Either<Failure, SearchEntity>>.fromIterable(
                [Left(Failure.generic())]));
      },
      actions: (stateNotifier) {
        stateNotifier.search();
      },
      expect: () => [
        const SearchState.loading(null),
        SearchState.failure(Failure.generic()),
      ],
    );

    stateNotifierTest<SearchNotifier, SearchState>(
      'executes first and second fetch and then fails',
      build: () => getProviderContainer().read(searchNotifierProvider.notifier),
      setUp: () {
        when(() => searchRepository.search(page: 1)).thenAnswer(
          (_) => Stream<Either<Failure, SearchEntity>>.fromIterable(
              [const Right(testSearchEntity), const Right(testSearchEntity)]),
        );
        when(() => searchRepository.search(page: 2)).thenAnswer((_) =>
            Stream<Either<Failure, SearchEntity>>.fromIterable(
                [Left(Failure.generic())]));
      },
      actions: (stateNotifier) async {
        await stateNotifier.search();
        await stateNotifier.search(firstFetch: false);
      },
      expect: () => [
        const SearchState.loading(null),
        const SearchState.loaded(testSearchEntity),
        const SearchState.loaded(testSearchEntity),
        const SearchState.loading(testSearchEntity),
        SearchState.failure(Failure.generic()),
      ],
    );

    test('make sure provider returns same notifier instance', () async {
      when(() => searchRepository.search(page: 1)).thenAnswer(
        (_) => Stream<Either<Failure, SearchEntity>>.fromIterable([]),
      );
      final providerContainer = ProviderContainer(overrides: [
        searchRepositoryProvider.overrideWith((_) => searchRepository),
      ]);
      final value = providerContainer.read(searchNotifierProvider);
      final value2 = providerContainer.read(searchNotifierProvider);
      expect(value, value2);
    });
  });
}
