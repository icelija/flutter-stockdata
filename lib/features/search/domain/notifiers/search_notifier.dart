import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/features/search/data/repositories/search_repository.dart';
import 'package:stockdata/features/search/domain/notifiers/search_state.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) => SearchNotifier(
          ref.watch(searchRepositoryProvider),
        )..search());

class SearchNotifier extends StateNotifier<SearchState> {
  final SearchRepository _searchRepository;

  SearchNotifier(this._searchRepository) : super(const SearchState.initial());

  Future<void> search() async {
    state = const SearchState.loading(null);
    final result = await _searchRepository.search();
    result.fold((l) => state = SearchState.failure(l), (r) {
      state = SearchState.loaded(r);
    });
  }
}
