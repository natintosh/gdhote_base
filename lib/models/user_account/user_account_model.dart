import 'package:gdhote/models/user_group/user_group.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_account_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class UserAccountModel extends HiveObject {
  static const userAccountBoxName = 'user-account';

  @JsonKey(name: 'id')
  @HiveField(0)
  String id;
  @JsonKey(name: 'ip_address')
  @HiveField(2)
  String ipAddress;
  @JsonKey(name: 'username')
  @HiveField(3)
  String userName;
  @JsonKey(name: 'email')
  @HiveField(4)
  String emailAddress;
  @JsonKey(name: 'lastLogin')
  @HiveField(5)
  String lastLogin;
  @JsonKey(name: 'active')
  @HiveField(6)
  String active;
  @JsonKey(name: 'firstName')
  @HiveField(7)
  String firstName;
  @JsonKey(name: 'lastName')
  @HiveField(8)
  String lastName;
  @JsonKey(name: 'group')
  @HiveField(9)
  List<UserGroupModel> group;

  UserAccountModel({
    this.id,
    this.ipAddress,
    this.userName,
    this.emailAddress,
    this.lastLogin,
    this.active,
    this.firstName,
    this.lastName,
    this.group,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserAccountModelToJson(this);
}
