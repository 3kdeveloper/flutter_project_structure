import 'dart:io';

import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // String? jwt = HiveBox().getValue(key: CommonKeys.jwt);
    //TODO Remove the below line and uncomment the above line
    String? jwt;
    if (jwt != null) {
      options.headers[HttpHeaders.authorizationHeader] = "Bearer $jwt";
    }
    super.onRequest(options, handler);
  }
}
