import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import 'package:stockdata/features/search/data/repositories/search_repository.dart';
import 'package:stockdata/features/search/domain/notifiers/search_notifier.dart';
import 'package:stockdata/features/search/domain/notifiers/search_state.dart';

//ignore: prefer-match-file-name
class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  late SearchRepository searchRepository;

  setUp(() {
    searchRepository = MockSearchRepository();
  });

  ProviderContainer getProviderContainer() => ProviderContainer(overrides: [
        searchNotifierProvider
            .overrideWith((ref) => SearchNotifier(searchRepository)),
      ]);

  group(' search()', () {
    stateNotifierTest<SearchNotifier, SearchState>(
      'executes success flow',
      build: () => getProviderContainer().read(searchNotifierProvider.notifier),
      setUp: () {
        // when(someRepository.method).thenAnswer(
        // (_) async => Future.value(const Right(None())),
        // );
      },
      actions: (stateNotifier) {},
      expect: () => [],
    );
    stateNotifierTest<SearchNotifier, SearchState>(
      'executes failure flow',
      build: () => getProviderContainer().read(searchNotifierProvider.notifier),
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
