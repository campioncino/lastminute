// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOut _$CheckOutFromJson(Map<String, dynamic> json) {
  return CheckOut()
    ..from = json['from'] as String
    ..to = json['to'] as String;
}

Map<String, dynamic> _$CheckOutToJson(CheckOut instance) {
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
