import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/heleper.dart';
import '../controller/reigster_controller.dart';
import '../controller/update_reg_controller.dart';

var updateController = Get.put(UpdateController());
var registerController = Get.put(ReigsterController());
Future<dynamic> OptionSheet(BuildContext context, var barnchId) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: const BoxDecoration(
              color: Color(0xffF5C6EC),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Color(0xffd3396d),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: ClipOval(
                      child: IconButton(
                          onPressed: () {
                            barnchId == ""
                                ? registerController.getPicCamera()
                                : updateController.getPicCamera();
                          },
                          icon: const Icon(Icons.camera_alt_outlined,
                              color: Colors.white)),
                    ),
                  ),
                  const Text('Camera')
                ],
              ),
              addHorizontalSpacing(50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Color(0xff1270e6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: ClipOval(
                      child: IconButton(
                          onPressed: () {
                            barnchId == ""
                                ? registerController.getPicGallary()
                                : updateController.getPicGallary();
                          },
                          icon: const Icon(
                            Icons.photo_album_outlined,
                            color: Colors.white,
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
}
