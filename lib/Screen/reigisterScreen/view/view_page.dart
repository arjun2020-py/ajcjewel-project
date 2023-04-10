import 'dart:developer';
import 'dart:ui';

import 'package:first_app/Utils/commonWidget/text_widget.dart';
import 'package:first_app/Utils/commonWidget/textfiled_widget.dart';
import 'package:first_app/Utils/helper/heleper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homeScreen/controller/home_list_controller.dart';
import '../controller/reigster_controller.dart';
import '../controller/update_reg_controller.dart';
import '../option_sheet.dart';

class ViewPageScreen extends StatefulWidget {
  ViewPageScreen({super.key, required this.barnchId});

  final String barnchId;

  @override
  State<ViewPageScreen> createState() => _ViewPageScreenState();
}

class _ViewPageScreenState extends State<ViewPageScreen> {
  var register = Get.put(ReigsterController());
  var updateController = Get.put(UpdateController());
  var home = Get.put(HomeListController());

  @override
  void initState() {
    super.initState();

    if (widget.barnchId != '') {
      updateController.updateList(widget.barnchId);
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
              updateController.isUpdating.value == true
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
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                radius: 30,
                                child: ClipOval(
                                    child: Obx(() =>
                                        updateController.imageFile.value != null
                                            ? Image.file(
                                                updateController
                                                    .imageFile.value!,
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 100,
                                              )
                                            : Image.network(
                                                'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: 100,
                                              ))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60, left: 60),
                              child: IconButton(
                                  onPressed: () {
                                    //  OptionSheet(context);

                                    //photo pick option.
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.55,
                                            decoration: const BoxDecoration(
                                                color: Color(0xffF5C6EC),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Card(
                                                      color: Color(0xffd3396d),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40)),
                                                      child: ClipOval(
                                                        child: IconButton(
                                                            onPressed: () {
                                                              widget.barnchId ==
                                                                      ""
                                                                  ? registerController
                                                                      .getPicCamera()
                                                                  : updateController
                                                                      .getPicCamera();
                                                            },
                                                            icon: const Icon(
                                                                Icons
                                                                    .camera_alt_outlined,
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    ),
                                                    const Text('Camera')
                                                  ],
                                                ),
                                                addHorizontalSpacing(50),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Card(
                                                      color: Color(0xff1270e6),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40)),
                                                      child: ClipOval(
                                                        child: IconButton(
                                                            onPressed: () {
                                                              widget.barnchId ==
                                                                      ""
                                                                  ? registerController
                                                                      .getPicGallary()
                                                                  : updateController
                                                                      .getPicGallary();
                                                            },
                                                            icon: const Icon(
                                                              Icons
                                                                  .photo_album_outlined,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    ),
                                                    const Text('Gallery')
                                                  ],
                                                )
                                              ],
                                            ));
                                      },
                                    );
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
                              ? updateController.nameController.value
                              : updateController.nameController.value,
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
                              ? updateController.emailController.value
                              : updateController.emailController.value,
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
                              ? updateController.mobileController.value
                              : updateController.mobileController.value,
                          vaildator: (value) {
                            if (!GetUtils.isPhoneNumber(value.toString())) {
                              return 'enter_vaild_mobile_number'.tr;
                            }
                          },
                        ),
                        addVerticalSpacing(10),
                        TextfiledWidget(
                          keyboardType: TextInputType.name,
                          txt: 'text_code'.tr,
                          icon: const Icon(Icons.code),
                          controller: updateController.textcodeController.value,
                          vaildator: (value) {},
                        ),
                        addVerticalSpacing(20),
                        Obx(
                          () => ElevatedButton(
                              onPressed: () {
                                widget.barnchId == ''
                                    ? register.RegisterList()
                                    : updateController
                                        .updateDataList(widget.barnchId);

                                //  updateController.TextcontrollerClear();
                              },
                              child: register.isLoading.value == true
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
