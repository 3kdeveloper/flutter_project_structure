import 'package:flutter_project_structure/blocs/api_request_status.dart';
import 'package:flutter_project_structure/helper/constants/constants_resources.dart';
import 'package:flutter_project_structure/helper/constants/route_names.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/global_variables.dart';

class HiveBox {
  static Future<void> setValue(
      {required String key, required dynamic value}) async {
    var box = Hive.box(ConstantsResouces.hiveBox);
    await box.put(key, value);
  }

  static Box getValue({required String key, dynamic defaultValue}) {
    var box = Hive.box(ConstantsResouces.hiveBox);
    return box.get(key, defaultValue: defaultValue);
  }

  static Future<void> updateValue(
      {required int index, required dynamic value}) async {
    var box = Hive.box(ConstantsResouces.hiveBox);
    return await box.putAt(index, value);
  }

  static Future<void> deleteValue({required String key}) async {
    var box = Hive.box(ConstantsResouces.hiveBox);
    await box.delete(key);
  }

  static Future<void> clearAppSession(
      {ApiRequestStatusFailure? apiRequestStatusFailure}) async {
    var box = Hive.box(ConstantsResouces.hiveBox);
    await box.clear();
    navigator.currentState?.pushNamedAndRemoveUntil(
        RouteNames.loginScreenRoute, (route) => false,
        arguments: apiRequestStatusFailure);
  }
}
