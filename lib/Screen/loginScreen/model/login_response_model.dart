// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        required this.message,
        required this.data,
        required this.goldTimelinesList,
        required this.currentDateTime,
        required this.company,
        required this.deliveryCounterIds,
        required this.token,
    });

    String message;
    Data data;
    List<GoldTimelinesList> goldTimelinesList;
    int currentDateTime;
    Company company;
    List<dynamic> deliveryCounterIds;
    String token;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        goldTimelinesList: List<GoldTimelinesList>.from(json["goldTimelinesList"].map((x) => GoldTimelinesList.fromJson(x))),
        currentDateTime: json["currentDateTime"],
        company: Company.fromJson(json["company"]),
        deliveryCounterIds: List<dynamic>.from(json["deliveryCounterIds"].map((x) => x)),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "goldTimelinesList": List<dynamic>.from(goldTimelinesList.map((x) => x.toJson())),
        "currentDateTime": currentDateTime,
        "company": company.toJson(),
        "deliveryCounterIds": List<dynamic>.from(deliveryCounterIds.map((x) => x)),
        "token": token,
    };
}

class Company {
    Company({
        required this.id,
        required this.email,
        required this.v,
        required this.address,
        required this.cin,
        required this.cityId,
        required this.createdAt,
        this.createdUserId,
        required this.dataGuard,
        required this.gst,
        required this.name,
        required this.pan,
        required this.phone,
        required this.place,
        required this.status,
        required this.updatedAt,
        this.updatedUserId,
        required this.cityDetails,
    });

    String id;
    String email;
    int v;
    String address;
    String cin;
    String cityId;
    int createdAt;
    dynamic createdUserId;
    List<int> dataGuard;
    String gst;
    String name;
    String pan;
    String phone;
    String place;
    int status;
    int updatedAt;
    dynamic updatedUserId;
    Details cityDetails;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["_id"],
        email: json["_email"],
        v: json["__v"],
        address: json["_address"],
        cin: json["_cin"],
        cityId: json["_cityId"],
        createdAt: json["_createdAt"],
        createdUserId: json["_createdUserId"],
        dataGuard: List<int>.from(json["_dataGuard"].map((x) => x)),
        gst: json["_gst"],
        name: json["_name"],
        pan: json["_pan"],
        phone: json["_phone"],
        place: json["_place"],
        status: json["_status"],
        updatedAt: json["_updatedAt"],
        updatedUserId: json["_updatedUserId"],
        cityDetails: Details.fromJson(json["cityDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_email": email,
        "__v": v,
        "_address": address,
        "_cin": cin,
        "_cityId": cityId,
        "_createdAt": createdAt,
        "_createdUserId": createdUserId,
        "_dataGuard": List<dynamic>.from(dataGuard.map((x) => x)),
        "_gst": gst,
        "_name": name,
        "_pan": pan,
        "_phone": phone,
        "_place": place,
        "_status": status,
        "_updatedAt": updatedAt,
        "_updatedUserId": updatedUserId,
        "cityDetails": cityDetails.toJson(),
    };
}

class Details {
    Details({
        required this.id,
        required this.code,
        required this.v,
        required this.createdAt,
        this.createdUserId,
        required this.dataGuard,
        this.districtsId,
        required this.name,
        required this.status,
        required this.updatedAt,
        this.updatedUserId,
        this.districtDetails,
        this.statesId,
        this.stateDetails,
        this.prefix,
        this.processMasterStatus,
        this.permissions,
    });

    String id;
    int code;
    int v;
    int createdAt;
    dynamic createdUserId;
    List<int> dataGuard;
    String? districtsId;
    String name;
    int status;
    int updatedAt;
    dynamic updatedUserId;
    Details? districtDetails;
    String? statesId;
    Details? stateDetails;
    String? prefix;
    int? processMasterStatus;
    List<dynamic>? permissions;

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["_id"],
        code: json["_code"],
        v: json["__v"],
        createdAt: json["_createdAt"],
        createdUserId: json["_createdUserId"],
        dataGuard: List<int>.from(json["_dataGuard"].map((x) => x)),
        districtsId: json["_districtsId"],
        name: json["_name"],
        status: json["_status"],
        updatedAt: json["_updatedAt"],
        updatedUserId: json["_updatedUserId"],
        districtDetails: json["districtDetails"] == null ? null : Details.fromJson(json["districtDetails"]),
        statesId: json["_statesId"],
        stateDetails: json["stateDetails"] == null ? null : Details.fromJson(json["stateDetails"]),
        prefix: json["_prefix"],
        processMasterStatus: json["_processMasterStatus"],
        permissions: json["_permissions"] == null ? [] : List<dynamic>.from(json["_permissions"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_code": code,
        "__v": v,
        "_createdAt": createdAt,
        "_createdUserId": createdUserId,
        "_dataGuard": List<dynamic>.from(dataGuard.map((x) => x)),
        "_districtsId": districtsId,
        "_name": name,
        "_status": status,
        "_updatedAt": updatedAt,
        "_updatedUserId": updatedUserId,
        "districtDetails": districtDetails?.toJson(),
        "_statesId": statesId,
        "stateDetails": stateDetails?.toJson(),
        "_prefix": prefix,
        "_processMasterStatus": processMasterStatus,
        "_permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x)),
    };
}

class Data {
    Data({
        required this.id,
        required this.email,
        required this.v,
        this.agentId,
        required this.createdAt,
        this.createdUserId,
        required this.customType,
        this.customerId,
        this.deliveryHubId,
        required this.deviceUniqueId,
        required this.employeeId,
        required this.fcmId,
        required this.gender,
        this.globalGalleryId,
        this.halmarkId,
        this.logisticPartnerId,
        required this.mobile,
        required this.name,
        required this.password,
        required this.permissions,
        this.shopId,
        required this.status,
        this.supplierId,
        this.testCenterId,
        required this.updatedAt,
        this.updatedUserId,
        required this.userType,
        required this.userDetails,
        required this.employeeAttendanceDetails,
    });

    String id;
    String email;
    int v;
    dynamic agentId;
    int createdAt;
    dynamic createdUserId;
    List<dynamic> customType;
    dynamic customerId;
    dynamic deliveryHubId;
    String deviceUniqueId;
    String employeeId;
    String fcmId;
    int gender;
    dynamic globalGalleryId;
    dynamic halmarkId;
    dynamic logisticPartnerId;
    String mobile;
    String name;
    String password;
    List<String> permissions;
    dynamic shopId;
    int status;
    dynamic supplierId;
    dynamic testCenterId;
    int updatedAt;
    dynamic updatedUserId;
    int userType;
    UserDetails userDetails;
    EmployeeAttendanceDetails employeeAttendanceDetails;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        email: json["_email"],
        v: json["__v"],
        agentId: json["_agentId"],
        createdAt: json["_createdAt"],
        createdUserId: json["_createdUserId"],
        customType: List<dynamic>.from(json["_customType"].map((x) => x)),
        customerId: json["_customerId"],
        deliveryHubId: json["_deliveryHubId"],
        deviceUniqueId: json["_deviceUniqueId"],
        employeeId: json["_employeeId"],
        fcmId: json["_fcmId"],
        gender: json["_gender"],
        globalGalleryId: json["_globalGalleryId"],
        halmarkId: json["_halmarkId"],
        logisticPartnerId: json["_logisticPartnerId"],
        mobile: json["_mobile"],
        name: json["_name"],
        password: json["_password"],
        permissions: List<String>.from(json["_permissions"].map((x) => x)),
        shopId: json["_shopId"],
        status: json["_status"],
        supplierId: json["_supplierId"],
        testCenterId: json["_testCenterId"],
        updatedAt: json["_updatedAt"],
        updatedUserId: json["_updatedUserId"],
        userType: json["_userType"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
        employeeAttendanceDetails: EmployeeAttendanceDetails.fromJson(json["employeeAttendanceDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_email": email,
        "__v": v,
        "_agentId": agentId,
        "_createdAt": createdAt,
        "_createdUserId": createdUserId,
        "_customType": List<dynamic>.from(customType.map((x) => x)),
        "_customerId": customerId,
        "_deliveryHubId": deliveryHubId,
        "_deviceUniqueId": deviceUniqueId,
        "_employeeId": employeeId,
        "_fcmId": fcmId,
        "_gender": gender,
        "_globalGalleryId": globalGalleryId,
        "_halmarkId": halmarkId,
        "_logisticPartnerId": logisticPartnerId,
        "_mobile": mobile,
        "_name": name,
        "_password": password,
        "_permissions": List<dynamic>.from(permissions.map((x) => x)),
        "_shopId": shopId,
        "_status": status,
        "_supplierId": supplierId,
        "_testCenterId": testCenterId,
        "_updatedAt": updatedAt,
        "_updatedUserId": updatedUserId,
        "_userType": userType,
        "userDetails": userDetails.toJson(),
        "employeeAttendanceDetails": employeeAttendanceDetails.toJson(),
    };
}

class EmployeeAttendanceDetails {
    EmployeeAttendanceDetails({
        required this.id,
        required this.userId,
        required this.startTime,
        required this.stopTime,
        required this.status,
        required this.v,
    });

    String id;
    String userId;
    int startTime;
    int stopTime;
    int status;
    int v;

    factory EmployeeAttendanceDetails.fromJson(Map<String, dynamic> json) => EmployeeAttendanceDetails(
        id: json["_id"],
        userId: json["_userId"],
        startTime: json["_startTime"],
        stopTime: json["_stopTime"],
        status: json["_status"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_userId": userId,
        "_startTime": startTime,
        "_stopTime": stopTime,
        "_status": status,
        "__v": v,
    };
}

class UserDetails {
    UserDetails({
        required this.id,
        required this.userId,
        required this.v,
        required this.createdAt,
        this.createdUserId,
        required this.dataGuard,
        required this.departmentId,
        required this.lastLogin,
        required this.prefix,
        this.processMasterId,
        required this.status,
        required this.uid,
        required this.updatedAt,
        required this.updatedUserId,
        required this.departmentDetails,
    });

    String id;
    String userId;
    int v;
    int createdAt;
    dynamic createdUserId;
    List<int> dataGuard;
    String departmentId;
    int lastLogin;
    String prefix;
    dynamic processMasterId;
    int status;
    String uid;
    int updatedAt;
    String updatedUserId;
    Details departmentDetails;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        userId: json["_userId"],
        v: json["__v"],
        createdAt: json["_createdAt"],
        createdUserId: json["_createdUserId"],
        dataGuard: List<int>.from(json["_dataGuard"].map((x) => x)),
        departmentId: json["_departmentId"],
        lastLogin: json["_lastLogin"],
        prefix: json["_prefix"],
        processMasterId: json["_processMasterId"],
        status: json["_status"],
        uid: json["_uid"],
        updatedAt: json["_updatedAt"],
        updatedUserId: json["_updatedUserId"],
        departmentDetails: Details.fromJson(json["departmentDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_userId": userId,
        "__v": v,
        "_createdAt": createdAt,
        "_createdUserId": createdUserId,
        "_dataGuard": List<dynamic>.from(dataGuard.map((x) => x)),
        "_departmentId": departmentId,
        "_lastLogin": lastLogin,
        "_prefix": prefix,
        "_processMasterId": processMasterId,
        "_status": status,
        "_uid": uid,
        "_updatedAt": updatedAt,
        "_updatedUserId": updatedUserId,
        "departmentDetails": departmentDetails.toJson(),
    };
}

class GoldTimelinesList {
    GoldTimelinesList({
        required this.id,
        required this.ratePerGram,
        required this.createdUserId,
        required this.createdAt,
        this.updatedUserId,
        required this.updatedAt,
        required this.status,
        required this.v,
    });

    String? id;
    int? ratePerGram;
    String? createdUserId;
    int? createdAt;
    dynamic updatedUserId;
    int? updatedAt;
    int? status;
    int? v;

    factory GoldTimelinesList.fromJson(Map<String, dynamic> json) => GoldTimelinesList(
        id: json["_id"],
        ratePerGram: json["_ratePerGram"],
        createdUserId: json["_createdUserId"],
        createdAt: json["_createdAt"],
        updatedUserId: json["_updatedUserId"],
        updatedAt: json["_updatedAt"],
        status: json["_status"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "_ratePerGram": ratePerGram,
        "_createdUserId": createdUserId,
        "_createdAt": createdAt,
        "_updatedUserId": updatedUserId,
        "_updatedAt": updatedAt,
        "_status": status,
        "__v": v,
    };
}