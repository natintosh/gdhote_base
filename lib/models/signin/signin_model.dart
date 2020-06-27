import 'package:json_annotation/json_annotation.dart';

part 'signin_model.g.dart';

@JsonSerializable()
class SignInModel {
  @JsonKey(name: 'username')
  String userName;
  @JsonKey(name: 'password')
  String password;

  SignInModel({this.userName, this.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
}
