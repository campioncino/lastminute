// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestError _$RestErrorFromJson(Map<String, dynamic> json) {
  return RestError()
    ..type = json['type'] as String
    ..title = json['title'] as String
    ..status = json['status'] as int
    ..path = json['path'] as String
    ..message = json['message'] as String
    ..fieldErrors = (json['fieldErrors'] as List)
        ?.map((e) =>
            e == null ? null : FieldErrors.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RestErrorToJson(RestError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('title', instance.title);
  writeNotNull('status', instance.status);
  writeNotNull('path', instance.path);
  writeNotNull('message', instance.message);
  writeNotNull(
      'fieldErrors', instance.fieldErrors?.map((e) => e?.toJson())?.toList());
  return val;
}
