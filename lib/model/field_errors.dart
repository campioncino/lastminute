import 'package:json_annotation/json_annotation.dart';

part 'field_errors.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class FieldErrors {
  factory FieldErrors.fromJson(Map<String, dynamic> json) =>
      _$FieldErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$FieldErrorsToJson(this);

  FieldErrors();

  String objectName;
  String field;
  String message;
}
