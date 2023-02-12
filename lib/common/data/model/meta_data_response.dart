import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data_response.g.dart';

@JsonSerializable()
class MetaDataResponse {
  final int found;
  final int returned;
  final int limit;
  final int page;

  const MetaDataResponse({
    required this.found,
    required this.returned,
    required this.limit,
    required this.page,
  });

  factory MetaDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaDataResponseFromJson(json);
}
