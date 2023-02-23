import 'package:equatable/equatable.dart';
import 'package:stockdata/features/news/domain/entities/news_stock_data.dart';

class NewsData extends Equatable {
  final String uuid;
  final String title;
  final String description;
  final String snippet;
  final String url;
  final String? imageUrl;
  final String language;
  final DateTime? publishedAt;
  final String source;
  final List<NewsStockData> entities;

  const NewsData({
    required this.uuid,
    required this.title,
    required this.description,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedAt,
    required this.source,
    required this.entities,
  });

  NewsData copyWith({
    String? uuid,
    String? title,
    String? description,
    String? snippet,
    String? url,
    String? imageUrl,
    String? language,
    DateTime? publishedAt,
    String? source,
    List<NewsStockData>? entities,
  }) {
    return NewsData(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      snippet: snippet ?? this.snippet,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      language: language ?? this.language,
      publishedAt: publishedAt ?? this.publishedAt,
      source: source ?? this.source,
      entities: entities ?? this.entities,
    );
  }

  @override
  List<Object?> get props => [
        uuid,
        title,
        description,
        snippet,
        url,
        imageUrl,
        language,
        publishedAt,
        source,
        entities,
      ];
}
