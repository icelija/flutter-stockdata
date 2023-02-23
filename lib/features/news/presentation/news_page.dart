import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/domain/utils/datetime_extension.dart';
import 'package:stockdata/features/news/domain/entities/news_entity.dart';
import 'package:stockdata/features/news/domain/notifiers/news_notifier.dart';
import 'package:stockdata/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text(S.current.news)),
      body: SafeArea(
        bottom: false,
        child: state.maybeWhen(
          orElse: () => const SizedBox(),
          failure: (failure) => Text('Failure: ${failure.title}'),
          loading: (data) => data != null
              ? NewsListView(newsEntity: data, isLoading: true)
              : const Center(child: CircularProgressIndicator()),
          loaded: (data) => NewsListView(newsEntity: data),
        ),
      ),
    );
  }
}

class NewsListView extends ConsumerWidget {
  final NewsEntity newsEntity;
  final bool isLoading;

  const NewsListView({
    super.key,
    required this.newsEntity,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (newsEntity.newsData.isEmpty) {
      return Text(S.current.no_data_for_your_query);
    }
    return RefreshIndicator(
      onRefresh: () => ref.read(newsNotifierProvider.notifier).getNews(),
      notificationPredicate: (notification) {
        if (notification.metrics.pixels > 0 && notification.metrics.atEdge) {
          ref.read(newsNotifierProvider.notifier).getNews(firstFetch: false);
        }
        return true;
      },
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 1,
          color: Colors.grey.shade400,
        ),
        itemCount: newsEntity.newsData.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == newsEntity.newsData.length) {
            return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const CircularProgressIndicator());
          }
          final stockData = newsEntity.newsData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!kIsWeb && stockData.imageUrl?.isNotEmpty == true)
                  CachedNetworkImage(
                    imageUrl: stockData.imageUrl!,
                    width: double.infinity,
                  ),
                const SizedBox(height: 10),
                Text(stockData.title,
                    style: Theme.of(context).textTheme.headlineSmall),
                if (stockData.description.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(stockData.description,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    final url = Uri.tryParse(stockData.url);
                    if (url != null) {
                      launchUrl(url);
                    }
                  },
                  child: Text(stockData.url,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: Colors.blue)),
                ),
                if (stockData.publishedAt != null)
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        stockData.publishedAt!.getFullDateString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ))
              ],
            ),
          );
        },
      ),
    );
  }
}
