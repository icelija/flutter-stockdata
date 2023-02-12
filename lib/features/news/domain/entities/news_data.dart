import 'package:equatable/equatable.dart';
import 'package:stockdata/features/news/domain/entities/news_stock_data.dart';

class NewsData extends Equatable {
  final String uuid;
  final String title;
  final String description;
  final String keywords;
  final String snippet;
  final String url;
  final String? imageUrl;
  final String language;
  final DateTime? publishedOn;
  final String source;
  final num? relevanceScore;
  final List<NewsStockData> entities;
  final List<NewsData>? similar;

  const NewsData({
    required this.uuid,
    required this.title,
    required this.description,
    required this.keywords,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedOn,
    required this.source,
    required this.relevanceScore,
    required this.entities,
    required this.similar,
  });

  NewsData copyWith({
    String? uuid,
    String? title,
    String? description,
    String? keywords,
    String? snippet,
    String? url,
    String? imageUrl,
    String? language,
    DateTime? publishedOn,
    String? source,
    num? relevanceScore,
    List<NewsStockData>? entities,
    List<NewsData>? similar,
  }) {
    return NewsData(
      uuid: uuid ?? this.uuid,
      title: title ?? this.title,
      description: description ?? this.description,
      keywords: keywords ?? this.keywords,
      snippet: snippet ?? this.snippet,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      language: language ?? this.language,
      publishedOn: publishedOn ?? this.publishedOn,
      source: source ?? this.source,
      relevanceScore: relevanceScore ?? this.relevanceScore,
      entities: entities ?? this.entities,
      similar: similar ?? this.similar,
    );
  }

  @override
  List<Object?> get props => [
        uuid,
        title,
        description,
        keywords,
        snippet,
        url,
        imageUrl,
        language,
        publishedOn,
        source,
        relevanceScore,
        entities,
        similar,
      ];
}
