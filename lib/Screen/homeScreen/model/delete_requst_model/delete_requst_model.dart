import 'package:json_annotation/json_annotation.dart';

part 'delete_requst_model.g.dart';

@JsonSerializable()
class DeleteRequstModel {
  List<String>? branchIds;

  int? status;

  DeleteRequstModel({this.branchIds, this.status});

  factory DeleteRequstModel.fromJson(Map<String, dynamic> json) {
    return _$DeleteRequstModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteRequstModelToJson(this);
}
