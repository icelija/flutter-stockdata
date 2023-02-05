// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntitySearchResponse _$EntitySearchResponseFromJson(
        Map<String, dynamic> json) =>
    EntitySearchResponse(
      metaDataResponse:
          MetaDataResponse.fromJson(json['meta'] as Map<String, dynamic>),
      stocksDataResponse: (json['data'] as List<dynamic>)
          .map((e) => StockDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EntitySearchResponseToJson(
        EntitySearchResponse instance) =>
    <String, dynamic>{
      'meta': instance.metaDataResponse,
      'data': instance.stocksDataResponse,
    };
