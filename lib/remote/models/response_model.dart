import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  ResponseModel(
      {required this.status, this.message, this.data, this.errorCode});

  @JsonKey(name: 'status')
  bool status;
  @JsonKey(name: 'message')
  dynamic message;
  @JsonKey(name: 'data')
  DataModel? data;
  int? errorCode;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
