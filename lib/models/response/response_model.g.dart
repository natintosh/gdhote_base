// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return ResponseModel(
    status: json['status'] as String,
    message: json['message'] as String,
    userMessage: json['userMessage'] as String,
    result: json['result'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'userMessage': instance.userMessage,
      'result': instance.result,
    };
