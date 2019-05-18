import 'package:json_annotation/json_annotation.dart';
import 'package:lm_flutter/model/check_in.dart';
import 'package:lm_flutter/model/check_out.dart';
import 'package:lm_flutter/model/contact.dart';
import 'package:lm_flutter/model/location.dart';

part 'hotel.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Hotel {
  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelToJson(this);

  Hotel();

  int id;
  String name;
  Location location;
  int stars;
  CheckIn checkIn;
  CheckOut checkOut;
  Contact contact;
  List<String> images = new List<String>();
  double userRating;
}
