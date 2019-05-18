import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Location {
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  Location();

  String address;
  String city;
  double latitude;
  double longitude;
}
