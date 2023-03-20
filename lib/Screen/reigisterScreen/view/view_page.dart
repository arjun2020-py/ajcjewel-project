import 'package:first_app/Utils/commonWidget/text_widget.dart';
import 'package:first_app/Utils/commonWidget/textfiled_widget.dart';
import 'package:first_app/Utils/helper/heleper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

import '../controller/reigster_controller.dart';

class ViewPageScreen extends StatelessWidget {
  ViewPageScreen({super.key});

  final registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(txt: 'Reigster', color: Colors.black, txtSize: 20),
            addVerticalSpacing(20),
            TextfiledWidget(
              txt: 'userName',
              icon: const Icon(Icons.person),
              controller: registerController.nameController,
              vaildator: (value) {
                if (!GetUtils.isUsername(value.toString())) {
                  return 'Enter vaild username';
                }
              },
            ),
            addVerticalSpacing(10),
            TextfiledWidget(
              txt: 'emailId',
              icon: const Icon(Icons.email),
              controller: registerController.emailController,
              vaildator: (value) {
                if (!GetUtils.isEmail(value.toString())) {
                  return 'Enter  vaild email id';
                }
              },
            ),
            addVerticalSpacing(10),
            TextfiledWidget(
              txt: 'mobNo',
              icon: const Icon(Icons.mobile_screen_share_sharp),
              controller: registerController.mobileController,
              vaildator: (value) {
                if (!GetUtils.isPhoneNumber(value.toString())) {
                  return 'Enter vaild mobile number';
                }
              },
            ),
            addVerticalSpacing(10),
            TextfiledWidget(
              txt: 'textcode',
              icon: const Icon(Icons.code),
              controller: registerController.textcodeController,
              vaildator: (value) {},
            ),
            addVerticalSpacing(20),
            Obx(
              () => ElevatedButton(
                  onPressed: () {
                    registerController.Register(
                        registerController.nameController.text,
                        registerController.emailController.text,
                        registerController.emailController.text,
                        registerController.textcodeController.text);
                  },
                  child: registerController.isLoading.value
                      ? CircularProgressIndicator()
                      : TextWidget(
                          txt: 'Submit', color: Colors.black, txtSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
