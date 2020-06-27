// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserGroupModelAdapter extends TypeAdapter<UserGroupModel> {
  @override
  final typeId = 1;

  @override
  UserGroupModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserGroupModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserGroupModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserGroupModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupModel _$UserGroupModelFromJson(Map<String, dynamic> json) {
  return UserGroupModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$UserGroupModelToJson(UserGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
