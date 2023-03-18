// To parse this JSON data, do
//
//     final registerAuthModel = registerAuthModelFromJson(jsonString);

import 'dart:convert';

RegisterAuthModel registerAuthModelFromJson(String str) => RegisterAuthModel.fromJson(json.decode(str));

String registerAuthModelToJson(RegisterAuthModel data) => json.encode(data.toJson());

class RegisterAuthModel {
    RegisterAuthModel({
        required this.array,
    });

    List<Array> array;

    factory RegisterAuthModel.fromJson(Map<String, dynamic> json) => RegisterAuthModel(
        array: List<Array>.from(json["array"].map((x) => Array.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "array": List<dynamic>.from(array.map((x) => x.toJson())),
    };
}

class Array {
    Array({
        required this.name,
        required this.code,
        required this.fileOriginalName,
        required this.description,
        required this.groupId,
        required this.dataGuard,
    });

    String? name;
    int? code;
    String? fileOriginalName;
    String? description;
    String? groupId;
    List<List<dynamic>> dataGuard;

    factory Array.fromJson(Map<String, dynamic> json) => Array(
        name: json["name"],
        code: json["code"],
        fileOriginalName: json["fileOriginalName"],
        description: json["description"],
        groupId: json["groupId"],
        dataGuard: List<List<dynamic>>.from(json["dataGuard"].map((x) => List<dynamic>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "fileOriginalName": fileOriginalName,
        "description": description,
        "groupId": groupId,
        "dataGuard": List<dynamic>.from(dataGuard.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}
