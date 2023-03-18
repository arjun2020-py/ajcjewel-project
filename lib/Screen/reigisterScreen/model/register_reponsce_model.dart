// To parse this JSON data, do
//
//     final registerReponseModel = registerReponseModelFromJson(jsonString);

import 'dart:convert';

RegisterReponseModel registerReponseModelFromJson(String str) => RegisterReponseModel.fromJson(json.decode(str));

String registerReponseModelToJson(RegisterReponseModel data) => json.encode(data.toJson());

class RegisterReponseModel {
    RegisterReponseModel({
        required this.message,
        required this.data,
    });

    String message;
    Data data;

    factory RegisterReponseModel.fromJson(Map<String, dynamic> json) => RegisterReponseModel(
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
        required this.code,
        required this.timestamp,
        required this.path,
        required this.method,
        required this.message,
        required this.reason,
    });

    int? code;
    String? timestamp;
    String? path;
    String? method;
    String? message;
    String? reason;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json["code"],
        timestamp: json["timestamp"],
        path: json["path"],
        method: json["method"],
        message: json["message"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "timestamp": timestamp,
        "path": path,
        "method": method,
        "message": message,
        "reason": reason,
    };
}
