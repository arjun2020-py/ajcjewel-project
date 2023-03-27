
class RegisterResponse {
    RegisterResponse({
        required this.id,
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
        required this.v,
    });

    String id;
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
    int v;

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        id: json["_id"],
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
        "_dataGuard": List<dynamic>.from(dataGuard.map((x) => x)),
        "_createdUserId": createdUserId,
        "_createdAt": createdAt,
        "_updatedUserId": updatedUserId,
        "_updatedAt": updatedAt,
        "_status": status,
        "__v": v,
    };
}
