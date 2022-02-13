// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      countryCode: json['countryCode'] as String?,
      point: json['point'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'sId': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'countryCode': instance.countryCode,
      'point': instance.point,
    };
