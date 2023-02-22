import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_data.g.dart';

@JsonSerializable()
class StockData extends Equatable {
  final String symbol;
  final String name;
  final String type;
  final String? industry;
  final String exchange;
  final String exchangeLong;
  final String micCode;
  final String country;

  const StockData({
    required this.symbol,
    required this.name,
    required this.type,
    this.industry,
    required this.exchange,
    required this.exchangeLong,
    required this.micCode,
    required this.country,
  });

  factory StockData.fromJson(Map<String, dynamic> json) =>
      _$StockDataFromJson(json);

  Map<String, dynamic> toJson() => _$StockDataToJson(this);

  StockData copyWith({
    String? symbol,
    String? name,
    String? type,
    String? industry,
    String? exchange,
    String? exchangeLong,
    String? micCode,
    String? country,
  }) {
    return StockData(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      type: type ?? this.type,
      industry: industry ?? this.industry,
      exchange: exchange ?? this.exchange,
      exchangeLong: exchangeLong ?? this.exchangeLong,
      micCode: micCode ?? this.micCode,
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
        micCode,
        country,
      ];
}
