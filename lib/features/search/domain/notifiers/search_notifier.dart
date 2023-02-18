import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/features/search/data/repositories/search_repository.dart';
import 'package:stockdata/features/search/domain/entities/stock_data.dart';
import 'package:stockdata/features/search/domain/notifiers/search_state.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) => SearchNotifier(
          ref.watch(searchRepositoryProvider),
        )..search());

class SearchNotifier extends StateNotifier<SearchState> {
  final SearchRepository _searchRepository;

  SearchNotifier(this._searchRepository) : super(const SearchState.initial());

  Future<void> search({bool firstFetch = true, String query = ''}) async {
    if (state.whenOrNull(loading: (data) => true) == true) {
      return;
    }
    final currentSearchEntity =
        firstFetch ? null : state.whenOrNull(loaded: (data) => data);
    state = SearchState.loading(currentSearchEntity);
    final result = await _searchRepository.search(
        query: query, page: (currentSearchEntity?.metaData.page ?? 0) + 1);
    result.fold((l) => state = SearchState.failure(l), (r) {
      final currentStocksData = state.maybeWhen(
          orElse: () => <StockData>[],
          loading: (data) => data?.stocksData ?? <StockData>[]);
      state = SearchState.loaded(
          r.copyWith(stocksData: currentStocksData + r.stocksData));
    });
  }
}
