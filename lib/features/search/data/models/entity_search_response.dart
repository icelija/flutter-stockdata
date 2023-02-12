import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stockdata/common/data/model/meta_data_response.dart';
import 'package:stockdata/features/search/data/models/stock_data_response.dart';

part 'entity_search_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EntitySearchResponse {
  @JsonKey(name: 'meta')
  final MetaDataResponse metaDataResponse;
  @JsonKey(name: 'data')
  final List<StockDataResponse> stocksDataResponse;

  const EntitySearchResponse({
    required this.metaDataResponse,
    required this.stocksDataResponse,
  });

  factory EntitySearchResponse.fromJson(Map<String, dynamic> json) =>
      _$EntitySearchResponseFromJson(json);
}
