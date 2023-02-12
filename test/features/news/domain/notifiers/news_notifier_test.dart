import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import 'package:stockdata/features/news/data/repositories/news_repository.dart';
import 'package:stockdata/features/news/domain/notifiers/news_notifier.dart';
import 'package:stockdata/features/news/domain/notifiers/news_state.dart';

//ignore: prefer-match-file-name

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsRepository newsRepository;

  setUp(() {
    newsRepository = MockNewsRepository();
  });

  ProviderContainer getProviderContainer() => ProviderContainer(overrides: [
        newsNotifierProvider
            .overrideWith((ref) => NewsNotifier(newsRepository)),
      ]);

  group(' getNews()', () {
    stateNotifierTest<NewsNotifier, NewsState>(
      'executes success flow',
      build: () => getProviderContainer().read(newsNotifierProvider.notifier),
      setUp: () {
        // when(someRepository.method).thenAnswer(
        // (_) async => Future.value(const Right(None())),
        // );
      },
      actions: (stateNotifier) {},
      expect: () => [],
    );
    stateNotifierTest<NewsNotifier, NewsState>(
      'executes failure flow',
      build: () => getProviderContainer().read(newsNotifierProvider.notifier),
      setUp: () {
        // when(someRepository.method).thenAnswer(
        // (_) async => Future.value(const Right(None())),
        // );
      },
      actions: (stateNotifier) {},
      expect: () => [],
    );
  });
}
