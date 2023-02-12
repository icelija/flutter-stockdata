// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
      metaDataResponse:
          MetaDataResponse.fromJson(json['meta'] as Map<String, dynamic>),
      newsDataResponse: (json['data'] as List<dynamic>)
          .map((e) => NewsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'meta': instance.metaDataResponse,
      'data': instance.newsDataResponse,
    };
