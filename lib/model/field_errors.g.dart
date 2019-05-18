// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldErrors _$FieldErrorsFromJson(Map<String, dynamic> json) {
  return FieldErrors()
    ..objectName = json['objectName'] as String
    ..field = json['field'] as String
    ..message = json['message'] as String;
}

Map<String, dynamic> _$FieldErrorsToJson(FieldErrors instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectName', instance.objectName);
  writeNotNull('field', instance.field);
  writeNotNull('message', instance.message);
  return val;
}
