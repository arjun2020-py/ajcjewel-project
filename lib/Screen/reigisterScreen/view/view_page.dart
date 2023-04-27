import 'dart:developer';

import 'package:first_app/Utils/commonWidget/text_widget.dart';
import 'package:first_app/Utils/commonWidget/textfiled_widget.dart';
import 'package:first_app/Utils/helper/heleper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homeScreen/controller/home_list_controller.dart';
import '../controller/reigster_controller.dart';
import '../widget/option_sheet.dart';
import '../widget/pick_image.dart';

class ViewPageScreen extends StatefulWidget {
  ViewPageScreen({super.key, required this.barnchId});

  final String barnchId;

  @override
  State<ViewPageScreen> createState() => _ViewPageScreenState();
}

class _ViewPageScreenState extends State<ViewPageScreen> {
  var registerController = Get.put(ReigsterController());
  var homeController = Get.put(HomeListController());

  @override
  void initState() {
    super.initState();

    if (widget.barnchId != '') {
      registerController.updateList(widget.barnchId);
      log(widget.barnchId);
    }
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
        child: Obx(
          () => ListView(
            children: [
              registerController.isUpdating.value == true
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                            txt: widget.barnchId == ''
                                ? 'reigster'.tr
                                : 'update'.tr,
                            color: Colors.black,
                            txtSize: 20),
                        addVerticalSpacing(20),
                        Stack(
                          children: [
                            //pick image show  on cricle avter.

                            PickImageShow(
                              homeController: homeController,
                              widget: widget,
                              registerController: registerController,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60, left: 60),
                              child: IconButton(
                                  onPressed: () {
                                    OptionSheet(context, widget.barnchId);
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                  )),
                            )
                          ],
                        ),
                        TextfiledWidget(
                          keyboardType: TextInputType.name,
                          txt: 'user_name'.tr,
                          icon: const Icon(Icons.person),
                          controller: widget.barnchId == ''
                              ? registerController.nameController.value
                              : registerController.nameController.value,
                          vaildator: (value) {
                            if (!GetUtils.isUsername(value.toString())) {
                              return 'enter_vaild_username'.tr;
                            }
                          },
                        ),
                        addVerticalSpacing(10),
                        TextfiledWidget(
                          keyboardType: TextInputType.emailAddress,
                          txt: 'email_id'.tr,
                          icon: const Icon(Icons.email),
                          controller: widget.barnchId == ''
                              ? registerController.emailController.value
                              : registerController.emailController.value,
                          vaildator: (value) {
                            if (!GetUtils.isEmail(value.toString())) {
                              return 'enter_vaild_email_id'.tr;
                            }
                          },
                        ),
                        addVerticalSpacing(10),
                        TextfiledWidget(
                          keyboardType: TextInputType.number,
                          txt: 'mob_no'.tr,
                          icon: const Icon(Icons.mobile_screen_share_sharp),
                          controller: widget.barnchId == ''
                              ? registerController.mobileController.value
                              : registerController.mobileController.value,
                          vaildator: (value) {
                            if (!GetUtils.isPhoneNumber(value.toString()) &&
                                !GetUtils.isLengthEqualTo(value, 10)) {
                              return 'enter_vaild_mobile_number'.tr;
                            }
                          },
                        ),
                        addVerticalSpacing(10),
                        TextfiledWidget(
                          keyboardType: TextInputType.name,
                          txt: 'text_code'.tr,
                          icon: const Icon(Icons.code),
                          controller:
                              registerController.textcodeController.value,
                          vaildator: (value) {},
                        ),
                        addVerticalSpacing(20),
                        Obx(
                          () => ElevatedButton(
                              onPressed: () {
                                registerController
                                    .createOrUpdate(widget.barnchId);
                              },
                              child: registerController.isLoading.value == true
                                  ? const CircularProgressIndicator()
                                  : TextWidget(
                                      txt: widget.barnchId == ''
                                          ? 'submit'.tr
                                          : 'updated'.tr,
                                      color: Colors.black,
                                      txtSize: 18)),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
