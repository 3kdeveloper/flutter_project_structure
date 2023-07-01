import 'package:flutter_project_structure/remote/models/response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_response.g.dart';

@JsonSerializable()
class MainResponse {
  MainResponse({required this.response});

  @JsonKey(name: 'response')
  ResponseModel response;

  factory MainResponse.fromJson(Map<String, dynamic> json) =>
      _$MainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseToJson(this);
}
