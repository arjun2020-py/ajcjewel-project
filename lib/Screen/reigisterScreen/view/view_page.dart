import 'dart:developer';

import 'package:first_app/Utils/commonWidget/text_widget.dart';
import 'package:first_app/Utils/commonWidget/textfiled_widget.dart';
import 'package:first_app/Utils/helper/heleper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homeScreen/controller/create/home_list_controller.dart';
import '../controller/reigster_controller.dart';
import '../controller/update_reg_controller.dart';

class ViewPageScreen extends StatefulWidget {
  ViewPageScreen({super.key, required this.barnchId});

  final barnchId;

  @override
  State<ViewPageScreen> createState() => _ViewPageScreenState();
}

class _ViewPageScreenState extends State<ViewPageScreen> {
  var registerController = Get.put(RegisterController());
  var updateController = Get.put(UpdateController());
  var home = Get.put(HomeListController());

  @override
  void initState() {
    super.initState();
    updateController.updateList(widget.barnchId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                    txt: widget.barnchId == '' ? 'Reigster' : 'Update',
                    color: Colors.black,
                    txtSize: 20),
                addVerticalSpacing(20),
                TextfiledWidget(
                  txt: 'userName',
                  icon: const Icon(Icons.person),
                  controller: widget.barnchId == ''
                      ? registerController.nameController
                      : registerController.nameController,
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
                  controller: widget.barnchId == ''
                      ? registerController.emailController
                      : registerController.emailController,
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
                  controller: widget.barnchId == ''
                      ? registerController.mobileController
                      : registerController.mobileController,
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
                        log(widget.barnchId);
                        widget.barnchId == ''
                            ? registerController.Register(
                                registerController.nameController.text,
                                registerController.emailController.text,
                                registerController.emailController.text,
                                registerController.textcodeController.text)
                            : updateController.updateDataList(widget.barnchId);
                        registerController.nameController.clear();
                        registerController.emailController.clear();
                        registerController.mobileController.clear();
                        registerController.textcodeController.clear();
                        home.registerList(0);
                      },
                      child: registerController.isLoading.value == true
                          ? const CircularProgressIndicator()
                          : TextWidget(
                              txt: widget.barnchId == '' ? 'Submit' : 'Updated',
                              color: Colors.black,
                              txtSize: 18)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
