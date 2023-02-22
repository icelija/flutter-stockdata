// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) => SearchEntity(
      metaData: MetaData.fromJson(json['metaData'] as Map<String, dynamic>),
      stocksData: (json['stocksData'] as List<dynamic>)
          .map((e) => StockData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchEntityToJson(SearchEntity instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'stocksData': instance.stocksData,
    };
