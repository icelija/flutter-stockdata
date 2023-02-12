import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_stock_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsStockDataResponse {
  final String symbol;
  final String name;
  final String type;
  final String? industry;
  final String exchange;
  final String exchangeLong;
  final String country;
  final num matchScore;
  final num sentimentScore;

  const NewsStockDataResponse({
    required this.symbol,
    required this.name,
    required this.type,
    this.industry,
    required this.exchange,
    required this.exchangeLong,
    required this.country,
    required this.matchScore,
    required this.sentimentScore,
  });

  factory NewsStockDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsStockDataResponseFromJson(json);
}
