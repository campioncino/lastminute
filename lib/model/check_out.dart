import 'package:json_annotation/json_annotation.dart';

part 'check_out.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class CheckOut {
  factory CheckOut.fromJson(Map<String, dynamic> json) =>
      _$CheckOutFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutToJson(this);

  CheckOut();

  String from;
  String to;
}
