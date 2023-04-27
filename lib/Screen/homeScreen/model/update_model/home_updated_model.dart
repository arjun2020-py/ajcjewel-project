// To parse this JSON data, do
//
//     final homeResponseModel = homeResponseModelFromJson(jsonString);

import 'dart:convert';

class HomeResponseModel {
  HomeResponseModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
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
    required this.list,
    required this.totalCount,
  });

  List<ListElement> list;
  int totalCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}

class ListElement {
  ListElement({
    this.invited = false,
    required this.id,
    required this.name,
    required this.uid,
    required this.email,
    required this.mobile,
    required this.tectCode,
    this.globalGalleryId,
    //required this.dataGuard,
    this.createdUserId,
    required this.createdAt,
    this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
    this.globalGalleryDetails,
  });
  bool invited;

  String id;
  String name;
  String uid;
  String email;
  String mobile;
  String tectCode;
  String? globalGalleryId;
  //List<dynamic> dataGuard;
  dynamic createdUserId;
  int createdAt;
  dynamic updatedUserId;
  int updatedAt;
  int status;
  int v;
  GlobalGalleryDetails? globalGalleryDetails;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        invited: json['invited'] ?? false,
        id: json["_id"],
        name: json["_name"],
        uid: json["_uid"],
        email: json["_email"],
        mobile: json["_mobile"],
        tectCode: json["_tectCode"],
        globalGalleryId: json["_globalGalleryId"],
        // dataGuard: List<dynamic>.from(json["_dataGuard"].map((x) => x)),
        createdUserId: json["_createdUserId"],
        createdAt: json["_createdAt"],
        updatedUserId: json["_updatedUserId"],
        updatedAt: json["_updatedAt"],
        status: json["_status"],
        v: json["__v"],
        globalGalleryDetails: json["globalGalleryDetails"] == null
            ? null
            : GlobalGalleryDetails.fromJson(json["globalGalleryDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_name": name,
        "_uid": uid,
        "_email": email,
        "_mobile": mobile,
        "_tectCode": tectCode,
        "_globalGalleryId": globalGalleryId,
        // "_dataGuard": List<dynamic>.from(dataGuard.map((x) => x)),
        "_createdUserId": createdUserId,
        "_createdAt": createdAt,
        "_updatedUserId": updatedUserId,
        "_updatedAt": updatedAt,
        "_status": status,
        "__v": v,
        "globalGalleryDetails": globalGalleryDetails?.toJson(),
      };
}

class GlobalGalleryDetails {
  GlobalGalleryDetails({
    required this.id,
    required this.name,
    this.globalGalleryCategoryId,
    required this.docType,
    required this.uid,
    required this.type,
    required this.url,
    this.createdUserId,
    required this.createdAt,
    this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
  });

  String id;
  String name;
  dynamic globalGalleryCategoryId;
  int docType;
  int uid;
  int type;
  String url;
  dynamic createdUserId;
  int createdAt;
  dynamic updatedUserId;
  int updatedAt;
  int status;
  int v;

  factory GlobalGalleryDetails.fromJson(Map<String, dynamic> json) =>
      GlobalGalleryDetails(
        id: json["_id"],
        name: json["_name"],
        globalGalleryCategoryId: json["_globalGalleryCategoryId"],
        docType: json["_docType"],
        uid: json["_uid"],
        type: json["_type"],
        url: json["_url"],
        createdUserId: json["_createdUserId"],
        createdAt: json["_createdAt"],
        updatedUserId: json["_updatedUserId"],
        updatedAt: json["_updatedAt"],
        status: json["_status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_name": name,
        "_globalGalleryCategoryId": globalGalleryCategoryId,
        "_docType": docType,
        "_uid": uid,
        "_type": type,
        "_url": url,
        "_createdUserId": createdUserId,
        "_createdAt": createdAt,
        "_updatedUserId": updatedUserId,
        "_updatedAt": updatedAt,
        "_status": status,
        "__v": v,
      };
}
