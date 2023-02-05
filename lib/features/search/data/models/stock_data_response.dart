import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StockDataResponse {
  final String symbol;
  final String name;
  final String type;
  final String? industry;
  final String exchange;
  final String exchangeLong;
  final String micCode;
  final String country;

  const StockDataResponse({
    required this.symbol,
    required this.name,
    required this.type,
    this.industry,
    required this.exchange,
    required this.exchangeLong,
    required this.micCode,
    required this.country,
  });

  factory StockDataResponse.fromJson(Map<String, dynamic> json) =>
      _$StockDataResponseFromJson(json);
}
