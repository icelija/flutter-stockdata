import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/api_client.dart';
import 'package:stockdata/common/data/mappers/entity_mapper.dart';
import 'package:stockdata/common/data/providers.dart';
import 'package:stockdata/common/domain/either_failure_or.dart';
import 'package:stockdata/common/domain/entities/failure.dart';
import 'package:stockdata/features/news/data/mappers/news_entity_mapper.dart';
import 'package:stockdata/features/news/data/models/news_response.dart';
import 'package:stockdata/features/news/domain/entities/news_entity.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepositoryImpl(
    ref.watch(apiClientProvider),
    ref.watch(newsEntityMapperProvider),
  );
});

abstract class NewsRepository {
  EitherFailureOr<NewsEntity> getNews({String query = '', int page = 1});
}

class NewsRepositoryImpl implements NewsRepository {
  final ApiClient _apiClient;
  final EntityMapper<NewsEntity, NewsResponse> _newsEntityMapper;

  NewsRepositoryImpl(
    this._apiClient,
    this._newsEntityMapper,
  );

  @override
  EitherFailureOr<NewsEntity> getNews({String query = '', int page = 1}) async {
    try {
      final result = await _apiClient.getNews(query, page);
      return Right(_newsEntityMapper(result));
    } catch (error, stacktrace) {
      return Left(Failure.generic(error: error, stackTrace: stacktrace));
    }
  }
}
