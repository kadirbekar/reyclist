import 'package:json_annotation/json_annotation.dart';
import 'package:reyclist_mobil/ui/login/model/user_model.dart';
import 'package:vexana/vexana.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel extends INetworkModel<UserResponseModel> {
  final bool? isOk;
  final String? message;
  final User? data;

  UserResponseModel({this.isOk, this.message, this.data});

  @override
  UserResponseModel fromJson(Map<String, dynamic> json) {
    return _$UserResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserResponseModelToJson(this);
  }
}

