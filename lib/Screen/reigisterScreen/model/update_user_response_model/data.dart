import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: '_name')
  String? name;
  @JsonKey(name: '_uid')
  String? uid;
  @JsonKey(name: '_email')
  String? email;
  @JsonKey(name: '_mobile')
  String? mobile;
  @JsonKey(name: '_tectCode')
  String? tectCode;
  @JsonKey(name: '_globalGalleryId')
  dynamic globalGalleryId;
  @JsonKey(name: '_dataGuard')
  List<int>? dataGuard;
  @JsonKey(name: '_createdUserId')
  dynamic createdUserId;
  @JsonKey(name: '_createdAt')
  int? createdAt;
  @JsonKey(name: '_updatedUserId')
  dynamic updatedUserId;
  @JsonKey(name: '_updatedAt')
  int? updatedAt;
  @JsonKey(name: '_status')
  int? status;
  @JsonKey(name: '__v')
  int? v;

  Data({
    this.id,
    this.name,
    this.uid,
    this.email,
    this.mobile,
    this.tectCode,
    this.globalGalleryId,
    this.dataGuard,
    this.createdUserId,
    this.createdAt,
    this.updatedUserId,
    this.updatedAt,
    this.status,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
