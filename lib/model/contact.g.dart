// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact()
    ..phoneNumber = json['phoneNumber'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  return val;
}
