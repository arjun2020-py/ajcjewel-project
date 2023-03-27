import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/home_scrren.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../model/login_auth_model.dart';
import '../model/login_response_model.dart';
import '../repositry/login_repositry.dart';

class LoginController extends GetxController {
  TextEditingController mobController = TextEditingController(),
      passController = TextEditingController();

  RxBool isloading = false.obs;

  LoginResponseModel? loginResponseModel;

  void login(String mob, String pass) async {
    isloading.value = true;

    Either<String, LoginResponseModel> result = await LoginRepositry()
        .login(LoginAuthModel(mobile: mob, password: pass));
    isloading.value = false;

    loginResponseModel = result.right;

    final data = jsonEncode(loginResponseModel);

    print(loginResponseModel!.token);

    //final token = loginResponseModel!.token;

    //Here we are store value or token  in shared prefence

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              isDismissible: true,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) async {
      log('---------------02');
      final token = right.token;
      // log(loginResponseModel);
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 3),
        message: 'Succssfully login',
        backgroundColor: Colors.green,
        icon: Icon(Icons.check_circle),
      ));
      final _shrepref = await SharedPreferences.getInstance();
      // _shrepref.setBool(key.toString(), true);
      final v = _shrepref.setString('loginToken', key.toString());

      Get.to(HomeScreen());
    });
  }
}
