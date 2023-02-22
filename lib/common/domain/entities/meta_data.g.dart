// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      found: json['found'] as int,
      returned: json['returned'] as int,
      limit: json['limit'] as int,
      page: json['page'] as int,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'found': instance.found,
      'returned': instance.returned,
      'limit': instance.limit,
      'page': instance.page,
    };
