import 'package:dio/dio.dart';

import '../core/values/app_values.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {

    var customHeaders = {
      'content-type': 'application/json',
      'Authorization': 'Bearer ${AppValues.appToken}'
    };

    return customHeaders;
  }
}
