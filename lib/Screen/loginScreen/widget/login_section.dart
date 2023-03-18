import 'dart:developer';

import 'package:first_app/Utils/helper/heleper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/commonWidget/text_widget.dart';
import '../../../Utils/commonWidget/textfiled_widget.dart';
import '../../../main.dart';
import '../controller/login_controller.dart';

final controller = Get.put(LoginController());
// final  SAVE_KEY_NAME = controller.loginResponseModel!.token;

class LoginSection extends StatelessWidget {
  const LoginSection({
    super.key,
    required this.isDark,
    required this.loginController,
  });

  final bool isDark;
  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
            txt: 'Login'.tr,
            color: isDark ? Colors.white : Colors.black,
            txtSize: 30),
        addVerticalSpacing(10),
        TextWidget(
            txt: 'Please login here'.tr,
            color: isDark ? Colors.white : Colors.black,
            txtSize: 18),
        addVerticalSpacing(10),
        TextfiledWidget(
            vaildator: (value) {
              if (!GetUtils.isPhoneNumber(value.toString())) {
                return 'Enter correct mobile number';
              } else {
                return null;
              }
            },
            txt: 'Mobile'.tr,
            controller: loginController.mobController,
            icon: const Icon(Icons.phone_rounded)),
        addVerticalSpacing(10),
        TextfiledWidget(
            vaildator: (value) {
              if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
                return 'Enter correct  passwrod';
              } else {
                return null;
              }
            },
            txt: 'Passwrod'.tr,
            icon: const Icon(Icons.security),
            controller: loginController.passController),
        addVerticalSpacing(18),
        SizedBox(
          width: 200,
          child: Obx(
            () => ElevatedButton(
                onPressed: () {
                  loginController.login(loginController.mobController.text,
                      loginController.passController.text);

                  // saveToStorage();
                  // saveToStorage();
                  log('------------------------a10');
                  // log('*************${controller.loginResponseModel!.token}');
                },
                child: loginController.isloading.value
                    ? const CircularProgressIndicator()
                    : TextWidget(
                        txt: 'Login'.tr,
                        color: isDark ? Colors.white : Colors.black,
                        txtSize: 18)),
          ),
        ),
      ],
    );
  }

  // Future<void> saveToStorage() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();

  //   await pref.setString('token', save_key);
  //   final token = pref.getString('token');
  //   log('---1');
  //   log(token.toString());
  // }
}
