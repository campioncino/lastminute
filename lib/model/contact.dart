import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Contact {
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  Contact();

  String phoneNumber;
  String email;
}
