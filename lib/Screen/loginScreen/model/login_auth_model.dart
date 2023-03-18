// To parse this JSON data, do
//
//     final loginAuthModel = loginAuthModelFromJson(jsonString);

import 'dart:convert';

LoginAuthModel loginAuthModelFromJson(String str) => LoginAuthModel.fromJson(json.decode(str));

String loginAuthModelToJson(LoginAuthModel data) => json.encode(data.toJson());

class LoginAuthModel {
    LoginAuthModel({
        required this.mobile,
        required this.password,
    });

    String? mobile;
    String? password;

    factory LoginAuthModel.fromJson(Map<String, dynamic> json) => LoginAuthModel(
        mobile: json["mobile"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
    };
}