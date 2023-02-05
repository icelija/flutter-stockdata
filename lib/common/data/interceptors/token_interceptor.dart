import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/constants.dart';

final tokenInterceptorProvider = Provider<TokenInterceptor>(
  (ref) => TokenInterceptor(),
);

class TokenInterceptor extends QueuedInterceptor {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    //options.responseType = ResponseType.json;
    options.queryParameters.addAll({'api_token': AppConstants.apiKey});
    super.onRequest(options, handler);
  }
}
