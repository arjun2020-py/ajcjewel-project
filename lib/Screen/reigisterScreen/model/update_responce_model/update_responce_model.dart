import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_responce_model.g.dart';

@JsonSerializable()
class UpdateResponceModel {
  String? message;
  Data? data;

  UpdateResponceModel({
    this.message,
    this.data,
  });

  factory UpdateResponceModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateResponceModelToJson(this);
}
