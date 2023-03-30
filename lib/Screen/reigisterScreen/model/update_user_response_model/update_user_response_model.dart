import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_user_response_model.g.dart';

@JsonSerializable()
class UpdateUserResponseModel {
  String? message;
  Data? data;

  UpdateUserResponseModel({this.message, this.data});

  factory UpdateUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateUserResponseModelToJson(this);
}
