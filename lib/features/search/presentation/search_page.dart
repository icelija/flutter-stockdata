import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/features/news/presentation/news_page.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';
import 'package:stockdata/features/search/domain/notifiers/search_notifier.dart';
import 'package:stockdata/generated/l10n.dart';

class SearchPage extends ConsumerWidget {
  static const routeName = '/search';

  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.search),
        actions: [
          GestureDetector(
            onTap: () => Beamer.of(context).beamToNamed(NewsPage.routeName),
            child: Text(S.current.news),
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: S.current.search,
                    border: const OutlineInputBorder()),
                onSubmitted: (value) => ref
                    .read(searchNotifierProvider.notifier)
                    .search(query: value),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: state.maybeWhen(
                orElse: () => const SizedBox(),
                failure: (failure) => Text('Failure: ${failure.title}'),
                loading: (data) => data != null
                    ? SearchListView(searchEntity: data, isLoading: true)
                    : const CircularProgressIndicator(),
                loaded: (data) => SearchListView(searchEntity: data),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchListView extends ConsumerWidget {
  final SearchEntity searchEntity;
  final bool isLoading;

  const SearchListView({
    super.key,
    required this.searchEntity,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (searchEntity.stocksData.isEmpty) {
      return Text(S.current.no_data_for_your_query);
    }
    return RefreshIndicator(
      onRefresh: () => ref.read(searchNotifierProvider.notifier).search(),
      notificationPredicate: (notification) {
        if (notification.metrics.pixels > 0 && notification.metrics.atEdge) {
          ref.read(searchNotifierProvider.notifier).search(firstFetch: false);
        }
        return true;
      },
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 1,
          color: Colors.grey.shade400,
        ),
        itemCount: searchEntity.stocksData.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == searchEntity.stocksData.length) {
            return const Center(child: CircularProgressIndicator());
          }
          final stockData = searchEntity.stocksData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${S.current.name}: ${stockData.name}'),
                Text('${S.current.symbol}: ${stockData.symbol}'),
                Text('${S.current.exchange}: ${stockData.exchange}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
