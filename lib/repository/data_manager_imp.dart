import '../remote/models/main_response.dart';

abstract class DataManagerImp {
  Future<MainResponse> signIn();
}
