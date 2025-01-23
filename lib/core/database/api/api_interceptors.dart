import 'package:dio/dio.dart';
import 'package:markaz_elamal/core/database/api/end_points.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // options.headers[Apikeys.token] = sl<CacheHelper>().getData(key: Apikeys.token) != null
    //     ? 'FOODAPI ${sl<CacheHelper>().getData(key: Apikeys.token)}'
    //     : null;

    super.onRequest(options, handler);
  }
}
