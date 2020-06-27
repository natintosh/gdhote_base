import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_group.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class UserGroupModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  String id;
  @JsonKey(name: 'name')
  @HiveField(1)
  String name;
  @JsonKey(name: 'description')
  @HiveField(3)
  String description;

  UserGroupModel({
    this.id,
    this.name,
    this.description,
  });

  factory UserGroupModel.fromJson(Map<String, dynamic> json) =>
      _$UserGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserGroupModelToJson(this);
}
