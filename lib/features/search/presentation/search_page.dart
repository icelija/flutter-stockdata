import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/features/news/presentation/news_page.dart';
import 'package:stockdata/features/search/domain/notifiers/search_notifier.dart';

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
        title: const Text('Search'),
        actions: [
          GestureDetector(
            onTap: () => Beamer.of(context).beamToNamed(NewsPage.routeName),
            child: const Text('News'),
          )
        ],
      ),
      body: SafeArea(
        child: state.maybeWhen(
          orElse: () => const CircularProgressIndicator(),
          failure: (failure) => Text('Failure: ${failure.title}'),
          loaded: (data) => ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.stocksData.length,
            itemBuilder: (context, index) {
              final stockData = data.stocksData[index];
              return Column(
                children: [
                  Text('Name: ${stockData.name}'),
                  Text('Symbol: ${stockData.symbol}'),
                  Text('Type: ${stockData.type}'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
