import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stockdata/features/news/data/models/news_stock_data_response.dart';

part 'news_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsDataResponse {
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
  final List<NewsStockDataResponse> entities;
  final List<NewsDataResponse>? similar;

  const NewsDataResponse({
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

  factory NewsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDataResponseFromJson(json);
}
