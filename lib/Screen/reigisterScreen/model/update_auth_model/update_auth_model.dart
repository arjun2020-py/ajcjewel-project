import 'package:json_annotation/json_annotation.dart';

part 'update_auth_model.g.dart';

@JsonSerializable()
class UpdateAuthModel {
  String? branchId;
  String? name;
  String? email;
  String? mobile;
  String? textCode;
  List<int>? dataGuard;

  UpdateAuthModel({
    this.branchId,
    this.name,
    this.email,
    this.mobile,
    this.textCode,
    this.dataGuard,
  });
  UpdateAuthModel.update({
    required this.branchId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.textCode,
    required this.dataGuard,
  });
  factory UpdateAuthModel.fromJson(Map<String, dynamic> json) {
    return _$UpdateAuthModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateAuthModelToJson(this);
}
