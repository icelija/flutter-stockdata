import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';
import 'package:stockdata/features/search/domain/entities/stock_data.dart';

part 'search_entity.g.dart';

@JsonSerializable()
class SearchEntity extends Equatable {
  final MetaData metaData;
  final List<StockData> stocksData;

  const SearchEntity({
    required this.metaData,
    required this.stocksData,
  });

  factory SearchEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchEntityToJson(this);

  SearchEntity copyWith({
    MetaData? metaData,
    List<StockData>? stocksData,
  }) {
    return SearchEntity(
      metaData: metaData ?? this.metaData,
      stocksData: stocksData ?? this.stocksData,
    );
  }

  @override
  List<Object?> get props => [
        metaData,
        stocksData,
      ];
}
