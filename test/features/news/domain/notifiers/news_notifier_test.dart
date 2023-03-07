import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import 'package:stockdata/common/domain/entities/failure.dart';
import 'package:stockdata/features/news/data/repositories/news_repository.dart';
import 'package:stockdata/features/news/domain/notifiers/news_notifier.dart';
import 'package:stockdata/features/news/domain/notifiers/news_state.dart';
import 'package:stockdata/generated/l10n.dart';

import '../../../../test_variables.dart';

//ignore: prefer-match-file-name

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsRepository newsRepository;

  setUpAll(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));

    newsRepository = MockNewsRepository();
  });

  ProviderContainer getProviderContainer() => ProviderContainer(overrides: [
        newsNotifierProvider
            .overrideWith((ref) => NewsNotifier(newsRepository)),
      ]);

  group('getNews()', () {
    stateNotifierTest<NewsNotifier, NewsState>(
      'executes first fetch successfully',
      build: () => getProviderContainer().read(newsNotifierProvider.notifier),
      setUp: () {
        when(() => newsRepository.getNews(page: 1, query: '')).thenAnswer(
          (_) async => Right(testNewsEntity),
        );
      },
      actions: (stateNotifier) {
        stateNotifier.getNews();
      },
      expect: () => [
        const NewsState.loading(null),
        NewsState.loaded(testNewsEntity),
      ],
    );

    stateNotifierTest<NewsNotifier, NewsState>(
      'executes multiple first fetch to test no same calls go through',
      build: () => getProviderContainer().read(newsNotifierProvider.notifier),
      setUp: () {
        when(() => newsRepository.getNews(page: 1, query: '')).thenAnswer(
          (_) async => Right(testNewsEntity),
        );
      },
      actions: (stateNotifier) {
        stateNotifier.getNews();
        stateNotifier.getNews();
      },
      expect: () => [
        const NewsState.loading(null),
        NewsState.loaded(testNewsEntity),
      ],
    );

    stateNotifierTest<NewsNotifier, NewsState>(
      'executes first and seconds fetch successfully',
      build: () => getProviderContainer().read(newsNotifierProvider.notifier),
      setUp: () {
        when(() => newsRepository.getNews(page: 1, query: '')).thenAnswer(
          (_) async => Right(testNewsEntity),
        );
        when(() => newsRepository.getNews(page: 2, query: ''))
            .thenAnswer((_) async => Right(testNewsEntity2));
      },
      actions: (stateNotifier) async {
        await stateNotifier.getNews();
        await stateNotifier.getNews(firstFetch: false);
      },
      expect: () => [
        const NewsState.loading(null),
        NewsState.loaded(testNewsEntity),
        NewsState.loading(testNewsEntity),
        NewsState.loaded(testNewsEntity2.copyWith(
            newsData: testNewsEntity.newsData + testNewsEntity2.newsData)),
      ],
    );

    stateNotifierTest<NewsNotifier, NewsState>(
      'executes first fetch and second fails',
      build: () => getProviderContainer().read(newsNotifierProvider.notifier),
      setUp: () {
        when(() => newsRepository.getNews()).thenAnswer(
          (_) async => Left(Failure.generic()),
        );
      },
      actions: (stateNotifier) {
        stateNotifier.getNews();
      },
      expect: () => [
        const NewsState.loading(null),
        NewsState.failure(Failure.generic()),
      ],
    );

    stateNotifierTest<NewsNotifier, NewsState>(
      'executes first and seconds fetch and then fails',
      build: () => getProviderContainer().read(newsNotifierProvider.notifier),
      setUp: () {
        when(() => newsRepository.getNews(page: 1)).thenAnswer(
          (_) async => Right(testNewsEntity),
        );
        when(() => newsRepository.getNews(page: 2)).thenAnswer(
          (_) async => Left(Failure.generic()),
        );
      },
      actions: (stateNotifier) async {
        await stateNotifier.getNews();
        await stateNotifier.getNews(firstFetch: false);
      },
      expect: () => [
        const NewsState.loading(null),
        NewsState.loaded(testNewsEntity),
        NewsState.loading(testNewsEntity),
        NewsState.failure(Failure.generic()),
      ],
    );
  });

  test('make sure provider returns same notifier instance', () async {
    when(() => newsRepository.getNews(page: 1)).thenAnswer(
      (_) async => Right(testNewsEntity),
    );
    final providerContainer = ProviderContainer(overrides: [
      newsRepositoryProvider.overrideWith((_) => newsRepository),
    ]);
    final value = providerContainer.read(newsNotifierProvider);
    final value2 = providerContainer.read(newsNotifierProvider);
    expect(value, value2);
  });
}
