import 'package:json_annotation/json_annotation.dart';
import 'package:lm_flutter/model/rest_error.dart';

part 'ws_response.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class WSResponse {
  factory WSResponse.fromJson(Map<String, dynamic> json) =>
      _$WSResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WSResponseToJson(this);

  WSResponse();

  RestError error;
  List<dynamic> data = new List();
  bool success;
}
