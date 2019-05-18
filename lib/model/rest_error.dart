import 'package:json_annotation/json_annotation.dart';

import 'field_errors.dart';

part 'rest_error.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RestError {
  factory RestError.fromJson(Map<String, dynamic> json) =>
      _$RestErrorFromJson(json);
  Map<String, dynamic> toJson() => _$RestErrorToJson(this);
  RestError();

  String type;
  String title;
  int status;
  String path;
  String message;
  List<FieldErrors> fieldErrors = new List();
}
