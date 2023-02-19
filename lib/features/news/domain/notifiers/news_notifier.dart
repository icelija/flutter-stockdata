import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/features/news/data/repositories/news_repository.dart';
import 'package:stockdata/features/news/domain/entities/news_data.dart';
import 'package:stockdata/features/news/domain/notifiers/news_state.dart';

final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier(
          ref.watch(newsRepositoryProvider),
        )..getNews());

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsRepository _newsRepository;

  NewsNotifier(this._newsRepository) : super(const NewsState.initial());

  Future<void> getNews({bool firstFetch = true}) async {
    if (state.whenOrNull(loading: (data) => true) == true) {
      return;
    }
    final currentNewsEntity =
        firstFetch ? null : state.whenOrNull(loaded: (data) => data);
    state = NewsState.loading(currentNewsEntity);
    final result = await _newsRepository.getNews(
        page: (currentNewsEntity?.metaData.page ?? 0) + 1);
    result.fold((l) => state = NewsState.failure(l), (r) {
      final currentNewsData = state.maybeWhen(
          orElse: () => <NewsData>[],
          loading: (data) => data?.newsData ?? <NewsData>[]);
      state =
          NewsState.loaded(r.copyWith(newsData: currentNewsData + r.newsData));
    });
  }
}
