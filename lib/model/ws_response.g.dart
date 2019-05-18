// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WSResponse _$WSResponseFromJson(Map<String, dynamic> json) {
  return WSResponse()
    ..error = json['error'] == null
        ? null
        : RestError.fromJson(json['error'] as Map<String, dynamic>)
    ..data = json['data'] as List
    ..success = json['success'] as bool;
}

Map<String, dynamic> _$WSResponseToJson(WSResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error?.toJson());
  writeNotNull('data', instance.data);
  writeNotNull('success', instance.success);
  return val;
}
