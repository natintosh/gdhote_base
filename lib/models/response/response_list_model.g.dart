// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseListModel _$ResponseListModelFromJson(Map<String, dynamic> json) {
  return ResponseListModel(
    status: json['status'] as String,
    message: json['message'] as String,
    userMessage: json['userMessage'] as String,
    result: (json['result'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseListModelToJson(ResponseListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'userMessage': instance.userMessage,
      'result': instance.result,
    };
