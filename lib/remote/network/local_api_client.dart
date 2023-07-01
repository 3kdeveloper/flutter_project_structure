import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_project_structure/remote/models/main_response.dart';

class LocalApiClient {
  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  Future<MainResponse> mockApiCall(String file) async {
    final resourcePath = _jsonDir + file + _jsonExtension;
    //TODO Add logger here console(resourcePath);
    String data = await rootBundle.loadString(resourcePath);
    final jsonResult = json.decode(data);
    // throw DioError(
    //   requestOptions: RequestOptions(path: ""),
    //   response: Response(
    //     requestOptions: RequestOptions(path: ""),
    //     statusCode: 406,
    //     data: {
    //       "response": {"status": false, "message": "Email Or password Wrong"}
    //     },
    //   ),
    // );
    return MainResponse.fromJson(jsonResult);
  }

  Future<dynamic> mockApiCallEmptyResponse() async {
    // throw DioError(
    //   requestOptions: RequestOptions(path: ""),
    //   response: Response(
    //     requestOptions: RequestOptions(path: ""),
    //     statusCode: 401,
    //     data: {
    //       "response": {"status": false, "message": "Email Or password Wrong"}
    //     },
    //   ),
    // );
    return "";
  }
}
