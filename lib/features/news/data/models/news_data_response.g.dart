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
      imageUrl: json['image_url'] as String?,
      language: json['language'] as String,
      publishedOn: json['published_on'] == null
          ? null
          : DateTime.parse(json['published_on'] as String),
      source: json['source'] as String,
      relevanceScore: json['relevance_score'] as num?,
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
      'image_url': instance.imageUrl,
      'language': instance.language,
      'published_on': instance.publishedOn?.toIso8601String(),
      'source': instance.source,
      'relevance_score': instance.relevanceScore,
      'entities': instance.entities,
      'similar': instance.similar,
    };
