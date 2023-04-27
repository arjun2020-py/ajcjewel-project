import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/heleper.dart';
import '../controller/home_list_controller.dart';

final listController = Get.put(HomeListController());

Future<dynamic> ModelSheetImagePicker(BuildContext context, final String brId) {
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
                            listController.getPicCamera();

                            if (listController.imageFile.value != null) {}
                            // registerController.picImageFromCamera(barnchId);
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
                            if (listController.imageFile.value != null) {
                              listController.getPicGallary();
                            }
                            //  registerController.picImageFromGallery();
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
