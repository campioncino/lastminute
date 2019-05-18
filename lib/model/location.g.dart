// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location()
    ..address = json['address'] as String
    ..city = json['city'] as String
    ..latitude = (json['latitude'] as num)?.toDouble()
    ..longitude = (json['longitude'] as num)?.toDouble();
}

Map<String, dynamic> _$LocationToJson(Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  writeNotNull('city', instance.city);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  return val;
}
