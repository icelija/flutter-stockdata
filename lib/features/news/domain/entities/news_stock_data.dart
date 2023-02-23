import 'package:equatable/equatable.dart';

class NewsStockData extends Equatable {
  final String symbol;
  final String name;
  final String type;
  final String? industry;
  final String exchange;
  final String exchangeLong;
  final String country;

  const NewsStockData({
    required this.symbol,
    required this.name,
    required this.type,
    this.industry,
    required this.exchange,
    required this.exchangeLong,
    required this.country,
  });

  NewsStockData copyWith({
    String? symbol,
    String? name,
    String? type,
    String? industry,
    String? exchange,
    String? exchangeLong,
    String? country,
  }) {
    return NewsStockData(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      type: type ?? this.type,
      industry: industry ?? this.industry,
      exchange: exchange ?? this.exchange,
      exchangeLong: exchangeLong ?? this.exchangeLong,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props => [
        symbol,
        name,
        type,
        industry,
        exchange,
        exchangeLong,
        country,
      ];
}
