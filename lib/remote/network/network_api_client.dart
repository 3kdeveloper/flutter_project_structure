import 'package:flutter_project_structure/remote/models/main_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'network_api_client.g.dart';

@RestApi(baseUrl: 'http://staging.eloumo.com/api/')
abstract class NetworkApiClient {
  factory NetworkApiClient(Dio dio, {String baseUrl}) = _NetworkApiClient;

  @POST('v1/user/signin')
  Future<MainResponse> signIn();
}
