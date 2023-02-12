import 'package:equatable/equatable.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';
import 'package:stockdata/features/news/domain/entities/news_data.dart';

class NewsEntity extends Equatable {
  final MetaData metaData;
  final List<NewsData> newsData;

  const NewsEntity({
    required this.metaData,
    required this.newsData,
  });

  NewsEntity copyWith({
    MetaData? metaData,
    List<NewsData>? newsData,
  }) {
    return NewsEntity(
      metaData: metaData ?? this.metaData,
      newsData: newsData ?? this.newsData,
    );
  }

  @override
  List<Object?> get props => [
        metaData,
        newsData,
      ];
}
