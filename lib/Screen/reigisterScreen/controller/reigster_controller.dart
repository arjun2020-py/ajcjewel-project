import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:either_dart/either.dart';
import 'package:first_app/Screen/reigisterScreen/controller/update_reg_controller.dart';
import 'package:flutter/material.dart';

import '../../homeScreen/view/screen_home.dart';
import '../model/register_reponsce_model.dart';
import '../repositry/reigister_repositry.dart';

class ReigsterController extends GetxController {
  final updateController = Get.put(UpdateController());
  RxBool isLoading = false.obs;
  Rx<File?> imageFile = Rx<File?>(null);
  var formData;

  Future<void> RegisterList() async {
    log('---------------------------pick1');
    isLoading.value = true;

    formData = dio.FormData.fromMap({
      "name": updateController.nameController.value.text,
      "email": updateController.emailController.value.text,
      "mobile": updateController.mobileController.value.text,
      "textCode": updateController.textcodeController.value.text,
      "dataGuard": "[]",
      if (imageFile.value != null)
        "image": await dio.MultipartFile.fromFile(
          imageFile.value!.path,
          filename: imageFile.value!.path.split("/").last,
        )
    });
    // log('---------------------------pick2');
    //  log('-----------${imageFile.value!.path}------');

    final Either<String, RegisterResponceModel> result =
        await ReigsterRepositry().RegisterList(payload: formData);

    log('---------------------------pick3');

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
      Get.off(HomeScreen());
    });
    log('---------------------------pick4');
  }

  Future<void> getPicCamera() async {
    final imagePicker = ImagePicker();
    final pickimage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickimage != null) {
      final file = File(pickimage.path);
      imageFile.value = file;
    }
    Get.back();
  }

  Future<void> getPicGallary() async {
    final imagePicker2 = ImagePicker();
    final XFile? pickimage2 =
        await imagePicker2.pickImage(source: ImageSource.gallery);

    if (pickimage2 != null) {
      //log('pick------------${pickimage2}---------');
      final file = File(pickimage2.path);
      imageFile.value = file;
    }
    log('------------${imageFile.value}---------');
    Get.back();
  }
}
