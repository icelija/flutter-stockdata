// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDataResponse _$NewsDataResponseFromJson(Map<String, dynamic> json) =>
    NewsDataResponse(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      keywords: json['keywords'] as String,
      snippet: json['snippet'] as String,
      url: json['url'] as String,
      imageUrl: json['imageUrl'] as String?,
      language: json['language'] as String,
      publishedOn: json['publishedOn'] == null
          ? null
          : DateTime.parse(json['publishedOn'] as String),
      source: json['source'] as String,
      relevanceScore: json['relevanceScore'] as num?,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => NewsStockDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      similar: (json['similar'] as List<dynamic>?)
          ?.map((e) => NewsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsDataResponseToJson(NewsDataResponse instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'description': instance.description,
      'keywords': instance.keywords,
      'snippet': instance.snippet,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'language': instance.language,
      'publishedOn': instance.publishedOn?.toIso8601String(),
      'source': instance.source,
      'relevanceScore': instance.relevanceScore,
      'entities': instance.entities,
      'similar': instance.similar,
    };
