// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) {
  return Hotel()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..location = json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>)
    ..stars = json['stars'] as int
    ..checkIn = json['checkIn'] == null
        ? null
        : CheckIn.fromJson(json['checkIn'] as Map<String, dynamic>)
    ..checkOut = json['checkOut'] == null
        ? null
        : CheckOut.fromJson(json['checkOut'] as Map<String, dynamic>)
    ..contact = json['contact'] == null
        ? null
        : Contact.fromJson(json['contact'] as Map<String, dynamic>)
    ..images = (json['images'] as List)?.map((e) => e as String)?.toList()
    ..userRating = (json['userRating'] as num)?.toDouble();
}

Map<String, dynamic> _$HotelToJson(Hotel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('location', instance.location?.toJson());
  writeNotNull('stars', instance.stars);
  writeNotNull('checkIn', instance.checkIn?.toJson());
  writeNotNull('checkOut', instance.checkOut?.toJson());
  writeNotNull('contact', instance.contact?.toJson());
  writeNotNull('images', instance.images);
  writeNotNull('userRating', instance.userRating);
  return val;
}
