import 'package:dio/dio.dart';
import 'package:food_ninja/core/api/end_points.dart';
import 'package:food_ninja/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        CacheHelper().getData(key: ApiKey.accessToken) != null
            ? 'Bearer ${CacheHelper().getData(key: ApiKey.accessToken)}'
            : null;
    super.onRequest(options, handler);
  }
}
