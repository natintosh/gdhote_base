// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserModel _$CreateUserModelFromJson(Map<String, dynamic> json) {
  return CreateUserModel(
    firstName: json['firstname'] as String,
    lastName: json['lastname'] as String,
    phoneNumber: json['phone'] as String,
    emailAddress: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$CreateUserModelToJson(CreateUserModel instance) =>
    <String, dynamic>{
      'firstname': instance.firstName,
      'lastname': instance.lastName,
      'phone': instance.phoneNumber,
      'email': instance.emailAddress,
      'password': instance.password,
    };
