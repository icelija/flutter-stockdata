import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/common/data/models/meta_data_response.dart';
import 'package:stockdata/common/domain/entities/meta_data.dart';

final metaDataEntityMapperProvider =
    Provider<EntityMapper<MetaData, MetaDataResponse>>(
  (ref) => (response) {
    return MetaData(
      found: response.found,
      limit: response.limit,
      page: response.page,
      returned: response.returned,
    );
  },
);
