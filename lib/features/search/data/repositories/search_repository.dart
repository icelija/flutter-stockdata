import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/common/data/providers.dart';
import 'package:stockdata/common/domain/either_failure_or.dart';
import 'package:stockdata/common/domain/entities/failure.dart';
import 'package:stockdata/features/search/data/mappers/search_entity_mapper.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepositoryImpl(
    ref.watch(apiClientProvider),
    ref.watch(searchEntityMapperProvider),
  );
});

abstract class SearchRepository {
  EitherFailureOr<SearchEntity> search({String query = "", int page = 1});
}

class SearchRepositoryImpl implements SearchRepository {
  final ApiClient _apiClient;
  final EntityMapper<SearchEntity, EntitySearchResponse> _searchEntityMapper;

  SearchRepositoryImpl(
    this._apiClient,
    this._searchEntityMapper,
  );

  @override
  EitherFailureOr<SearchEntity> search(
      {String query = '', int page = 1}) async {
    try {
      final result = await _apiClient.searchEntities(query, page);
      return Right(_searchEntityMapper(result));
    } catch (error, stacktrace) {
      return Left(Failure.generic(error: error, stackTrace: stacktrace));
    }
  }
}
