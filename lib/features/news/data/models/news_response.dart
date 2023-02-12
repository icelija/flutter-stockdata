import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stockdata/common/data/model/meta_data_response.dart';
import 'package:stockdata/features/news/data/models/news_data_response.dart';

part 'news_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsResponse {
  @JsonKey(name: 'meta')
  final MetaDataResponse metaDataResponse;
  @JsonKey(name: 'data')
  final List<NewsDataResponse> newsDataResponse;

  const NewsResponse({
    required this.metaDataResponse,
    required this.newsDataResponse,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}
