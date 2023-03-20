import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/home_scrren.dart';
import 'package:first_app/Screen/reigisterScreen/model/register_reponsce_model.dart';
import 'package:first_app/Screen/reigisterScreen/model/reigister_auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../repositry/reigister_repositry.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      mobileController = TextEditingController(),
      textcodeController = TextEditingController();
  RxBool isLoading = false.obs;
  RegisterResponceModel? registerResponsceModel;

  void Register(
      String name, String email, String mobno, String textCode) async {
    isLoading.value = true;
    Either<String, RegisterResponceModel> result = await ReigsterRepositry()
        .Register(RegisterAuthModel(
            name: name,
            email: email,
            mobile: mobno,
            textCode: textCode,
            dataGuard: []));

    isLoading.value = false;

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              message: left,
              isDismissible: true,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Sucessfully registed',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        icon: Icon(Icons.check_outlined),
      ));
      Get.to(HomeScreen());
    });
  }
}
