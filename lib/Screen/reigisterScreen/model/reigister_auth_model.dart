// To parse this JSON data, do
//
//     final registerAuthModel = registerAuthModelFromJson(jsonString);

import 'dart:convert';

RegisterAuthModel registerAuthModelFromJson(String str) =>
    RegisterAuthModel.fromJson(json.decode(str));

String registerAuthModelToJson(RegisterAuthModel data) =>
    json.encode(data.toJson());

class RegisterAuthModel {
  RegisterAuthModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.textCode,
    required this.dataGuard,
  });

  //create a sperate constuctor for
  RegisterAuthModel.create({
    required this.name,
    required this.email,
    required this.mobile,
    required this.textCode,
    required this.dataGuard,
  });
  String name;
  String email;
  String mobile;
  String textCode;
  List<List<dynamic>> dataGuard;

  factory RegisterAuthModel.fromJson(Map<String, dynamic> json) =>
      RegisterAuthModel(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        textCode: json["textCode"],
        dataGuard: List<List<dynamic>>.from(
            json["dataGuard"].map((x) => List<dynamic>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "textCode": textCode,
        "dataGuard": List<dynamic>.from(
            dataGuard.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
