import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/features/news/domain/notifiers/news_notifier.dart';

class NewsPage extends ConsumerWidget {
  static const routeName = '/news';

  const NewsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: state.maybeWhen(
          orElse: () => const CircularProgressIndicator(),
          failure: (failure) => Text('Failure: ${failure.title}'),
          loaded: (data) => ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: data.newsData.length,
            itemBuilder: (context, index) {
              final stockData = data.newsData[index];
              return Column(
                children: [
                  Text('Title: ${stockData.title}'),
                  Text('Description: ${stockData.description}'),
                  Text('Url: ${stockData.url}'),
                  Text('Entities: ${stockData.entities}'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
