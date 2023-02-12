import 'package:equatable/equatable.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';
import 'package:stockdata/features/search/domain/entities/stock_data.dart';

class SearchEntity extends Equatable {
  final MetaData metaData;
  final List<StockData> stocksData;

  const SearchEntity({
    required this.metaData,
    required this.stocksData,
  });

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
