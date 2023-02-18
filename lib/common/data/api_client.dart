import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stockdata/features/news/data/models/news_response.dart';
import 'package:stockdata/features/search/data/models/entity_search_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/entity/search')
  Future<EntitySearchResponse> searchEntities(
    @Query('search') String search,
    @Query('page') int page,
  );

  @GET('/news/all?language=en')
  Future<NewsResponse> getNews(
    @Query('search') String search,
    @Query('page') int page,
  );
}
