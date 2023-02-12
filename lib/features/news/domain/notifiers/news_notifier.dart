import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/features/news/data/repositories/news_repository.dart';
import 'package:stockdata/features/news/domain/notifiers/news_state.dart';

final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier(
          ref.watch(newsRepositoryProvider),
        )..getNews());

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsRepository _newsRepository;

  NewsNotifier(this._newsRepository) : super(const NewsState.initial());

  Future<void> getNews() async {
    state = const NewsState.loading(null);
    final result = await _newsRepository.getNews();
    result.fold((l) => state = NewsState.failure(l), (r) {
      state = NewsState.loaded(r);
    });
  }
}
