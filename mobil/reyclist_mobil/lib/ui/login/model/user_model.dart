import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  const User({
    this.id,
    this.email,
    this.password,
    this.name,
    this.surname,
    this.phoneNumber,
    this.countryCode,
    this.point,
  });

  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? surname;
  final String? phoneNumber;
  final String? countryCode;
  final int? point;

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic>? toJson() {
    return _$UserToJson(this);
  }
}
