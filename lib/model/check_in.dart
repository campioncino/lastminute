import 'package:json_annotation/json_annotation.dart';

part 'check_in.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class CheckIn {
  factory CheckIn.fromJson(Map<String, dynamic> json) =>
      _$CheckInFromJson(json);

  Map<String, dynamic> toJson() => _$CheckInToJson(this);

  CheckIn();

  String from;
  String to;
}
