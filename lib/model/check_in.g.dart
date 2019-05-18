// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckIn _$CheckInFromJson(Map<String, dynamic> json) {
  return CheckIn()
    ..from = json['from'] as String
    ..to = json['to'] as String;
}

Map<String, dynamic> _$CheckInToJson(CheckIn instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from);
  writeNotNull('to', instance.to);
  return val;
}
