import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_data.g.dart';

@JsonSerializable()
class MetaData extends Equatable {
  final int found;
  final int returned;
  final int limit;
  final int page;

  const MetaData({
    required this.found,
    required this.returned,
    required this.limit,
    required this.page,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);

  MetaData copyWith({
    int? found,
    int? returned,
    int? limit,
    int? page,
  }) {
    return MetaData(
      found: found ?? this.found,
      returned: returned ?? this.returned,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        found,
        returned,
        limit,
        page,
      ];
}
