import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/common/data/providers.dart';
import 'package:stockdata/common/data/repositories/local_storage_repository.dart';
import 'package:stockdata/common/domain/either_failure_or.dart';
import 'package:stockdata/common/domain/entities/failure.dart';
import 'package:stockdata/features/search/data/mappers/search_entity_mapper.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepositoryImpl(
    ref.watch(apiClientProvider),
    ref.watch(searchEntityMapperProvider),
    ref.watch(localStorageProvider),
  );
});

abstract class SearchRepository {
  StreamFailureOr<SearchEntity> search({String query = "", int page = 1});
}

class SearchRepositoryImpl implements SearchRepository {
  final ApiClient _apiClient;
  final EntityMapper<SearchEntity, EntitySearchResponse> _searchEntityMapper;
  final LocalStorageRepository _localStorageRepository;

  SearchRepositoryImpl(
    this._apiClient,
    this._searchEntityMapper,
    this._localStorageRepository,
  );

  @override
  StreamFailureOr<SearchEntity> search(
      {String query = '', int page = 1}) async* {
    try {
      final isFirstPageAndEmptyQuery = query.isEmpty && page == 1;
      if (isFirstPageAndEmptyQuery) {
        final cachedData = await _localStorageRepository.getSearchData();
        if (cachedData != null) yield Right(cachedData);
      }
      final result = await _apiClient.searchEntities(query, page);
      final searchEntity = _searchEntityMapper(result);
      if (isFirstPageAndEmptyQuery) {
        await _localStorageRepository.setSearchData(searchEntity: searchEntity);
      }
      yield Right(searchEntity);
    } catch (error, stacktrace) {
      yield Left(Failure.generic(error: error, stackTrace: stacktrace));
    }
  }
}
