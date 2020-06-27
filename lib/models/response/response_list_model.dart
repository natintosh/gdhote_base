import 'package:json_annotation/json_annotation.dart';

part 'response_list_model.g.dart';

@JsonSerializable()
class ResponseListModel {
  String status;
  String message;
  String userMessage;
  List<Map<String, dynamic>> result;

  ResponseListModel({this.status, this.message, this.userMessage, this.result});

  factory ResponseListModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseListModelToJson(this);
}
