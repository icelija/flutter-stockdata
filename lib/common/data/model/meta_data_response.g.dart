// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataResponse _$MetaDataResponseFromJson(Map<String, dynamic> json) =>
    MetaDataResponse(
      found: json['found'] as int,
      returned: json['returned'] as int,
      limit: json['limit'] as int,
      page: json['page'] as int,
    );

Map<String, dynamic> _$MetaDataResponseToJson(MetaDataResponse instance) =>
    <String, dynamic>{
      'found': instance.found,
      'returned': instance.returned,
      'limit': instance.limit,
      'page': instance.page,
    };
