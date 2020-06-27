// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAccountModelAdapter extends TypeAdapter<UserAccountModel> {
  @override
  final typeId = 0;

  @override
  UserAccountModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAccountModel(
      id: fields[0] as String,
      ipAddress: fields[2] as String,
      userName: fields[3] as String,
      emailAddress: fields[4] as String,
      lastLogin: fields[5] as String,
      active: fields[6] as String,
      firstName: fields[7] as String,
      lastName: fields[8] as String,
      group: (fields[9] as List)?.cast<UserGroupModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserAccountModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.ipAddress)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.emailAddress)
      ..writeByte(5)
      ..write(obj.lastLogin)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.firstName)
      ..writeByte(8)
      ..write(obj.lastName)
      ..writeByte(9)
      ..write(obj.group);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAccountModel _$UserAccountModelFromJson(Map<String, dynamic> json) {
  return UserAccountModel(
    id: json['id'] as String,
    ipAddress: json['ip_address'] as String,
    userName: json['username'] as String,
    emailAddress: json['email'] as String,
    lastLogin: json['lastLogin'] as String,
    active: json['active'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    group: (json['group'] as List)
        ?.map((e) => e == null
            ? null
            : UserGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserAccountModelToJson(UserAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ip_address': instance.ipAddress,
      'username': instance.userName,
      'email': instance.emailAddress,
      'lastLogin': instance.lastLogin,
      'active': instance.active,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'group': instance.group,
    };
