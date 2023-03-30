// To parse this JSON data, do
//
//     final registerResponceModel = registerResponceModelFromJson(jsonString);

import 'dart:convert';

RegisterResponceModel registerResponceModelFromJson(String str) =>
    RegisterResponceModel.fromJson(json.decode(str));

String registerResponceModelToJson(RegisterResponceModel data) =>
    json.encode(data.toJson());

class RegisterResponceModel {
  RegisterResponceModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory RegisterResponceModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponceModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.uid,
    required this.email,
    required this.mobile,
    required this.tectCode,
    this.globalGalleryId,
    required this.dataGuard,
    this.createdUserId,
    required this.createdAt,
    this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.id,
    required this.v,
  });

  String name;
  String uid;
  String email;
  String mobile;
  String tectCode;
  dynamic globalGalleryId;
  List<int> dataGuard;
  dynamic createdUserId;
  int createdAt;
  dynamic updatedUserId;
  int updatedAt;
  int status;
  String id;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["_name"],
        uid: json["_uid"],
        email: json["_email"],
        mobile: json["_mobile"],
        tectCode: json["_tectCode"],
        globalGalleryId: json["_globalGalleryId"],
        dataGuard: List<int>.from(json["_dataGuard"].map((x) => x)),
        createdUserId: json["_createdUserId"],
        createdAt: json["_createdAt"],
        updatedUserId: json["_updatedUserId"],
        updatedAt: json["_updatedAt"],
        status: json["_status"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_name": name,
        "_uid": uid,
        "_email": email,
        "_mobile": mobile,
        "_tectCode": tectCode,
        "_globalGalleryId": globalGalleryId,
        "_dataGuard": List<dynamic>.from(dataGuard.map((x) => x)),
        "_createdUserId": createdUserId,
        "_createdAt": createdAt,
        "_updatedUserId": updatedUserId,
        "_updatedAt": updatedAt,
        "_status": status,
        "_id": id,
        "__v": v,
      };
}
