import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockdata/common/data/interceptors/token_interceptor.dart';
import 'package:stockdata/constants.dart';

import 'api_client.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(
      dioProvider(AppConstants.apiBaseUrl),
    ),
  ),
);

final dioProvider = Provider.family<Dio, String>((ref, baseUrl) => Dio(
      BaseOptions(baseUrl: baseUrl),
    )..interceptors.addAll(
        [
          ref.watch(tokenInterceptorProvider),
        ],
      ));
