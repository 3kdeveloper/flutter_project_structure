import 'package:dio/dio.dart';
import 'package:flutter_project_structure/remote/models/main_response.dart';
import 'package:flutter_project_structure/remote/models/response_model.dart';
import 'package:flutter_project_structure/remote/network/local_api_client.dart';
import 'package:flutter_project_structure/remote/network/network_api_client.dart';
import 'package:flutter_project_structure/repository/data_manager_imp.dart';

class DataManager implements DataManagerImp {
  late final LocalApiClient _localApiClient;
  late final NetworkApiClient _networkApiClient;

  DataManager(
      {required LocalApiClient localApiClient,
      required NetworkApiClient networkApiClient}) {
    _localApiClient = localApiClient;
    _networkApiClient = networkApiClient;
  }

  @override
  Future<MainResponse> signIn() => _localApiClient
      .mockApiCall('sign_in')
      .then((successResponse) => successResponse)
      .catchError((e) => _returnRunTimeTypeError(e));

  MainResponse _returnRunTimeTypeError(e) {
    switch (e.runtimeType) {
      case DioException:
        return _errorHandling(e);
      default:
        return MainResponse(
            response: ResponseModel(status: false, message: e.toString()));
    }
  }

  MainResponse _errorHandling(DioException e) {
    final errorResponse = e.response;
    if (errorResponse?.data != null) {
      var jsonResponse = MainResponse.fromJson(errorResponse?.data);
      return MainResponse(
          response: ResponseModel(
              message: jsonResponse.response.message,
              status: jsonResponse.response.status,
              errorCode: errorResponse?.statusCode));
    } else {
      return MainResponse(
          response: ResponseModel(
              message: 'Something went wrong!',
              status: false,
              errorCode: errorResponse?.statusCode));
    }
  }
}
