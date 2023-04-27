import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'delete_branch_response.g.dart';

@JsonSerializable()
class DeleteBranchResponse {
  String? message;
  Data? data;

  DeleteBranchResponse({this.message, this.data});

  factory DeleteBranchResponse.fromJson(Map<String, dynamic> json) {
    return _$DeleteBranchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteBranchResponseToJson(this);
}
