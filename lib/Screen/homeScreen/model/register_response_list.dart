//
//     final regsiterResponseListModel = regsiterResponseListModelFromJson(jsonString);

class RegsiterResponseListModel {
  RegsiterResponseListModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory RegsiterResponseListModel.fromJson(Map<String, dynamic> json) =>
      RegsiterResponseListModel(
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
    required this.id,
    required this.name,
    required this.uid,
    required this.email,
    required this.mobile,
    required this.tectCode,
    this.globalGalleryId,
    this.createdUserId,
    required this.createdAt,
    this.updatedUserId,
    required this.updatedAt,
    required this.status,
    required this.v,
  });

  String id;
  String name;
  String uid;
  String email;
  String mobile;
  String tectCode;
  dynamic globalGalleryId;
  dynamic createdUserId;
  int createdAt;
  dynamic updatedUserId;
  int updatedAt;
  int status;
  int v;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        name: json["_name"],
        uid: json["_uid"],
        email: json["_email"],
        mobile: json["_mobile"],
        tectCode: json["_tectCode"],
        globalGalleryId: json["_globalGalleryId"],
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
        "_uid": uid,
        "_email": email,
        "_mobile": mobile,
        "_tectCode": tectCode,
        "_globalGalleryId": globalGalleryId,
        "_createdUserId": createdUserId,
        "_createdAt": createdAt,
        "_updatedUserId": updatedUserId,
        "_updatedAt": updatedAt,
        "_status": status,
        "__v": v,
      };
}
