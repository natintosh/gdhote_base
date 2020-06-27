import 'package:json_annotation/json_annotation.dart';

part 'create_user_model.g.dart';

@JsonSerializable()
class CreateUserModel {
  @JsonKey(name: 'firstname')
  String firstName;
  @JsonKey(name: 'lastname')
  String lastName;
  @JsonKey(name: 'phone')
  String phoneNumber;
  @JsonKey(name: 'email')
  String emailAddress;
  @JsonKey(name: 'password')
  String password;

  CreateUserModel(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.emailAddress,
      this.password});

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserModelToJson(this);
}
