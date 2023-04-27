import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import '../../homeScreen/controller/home_list_controller.dart';
import '../../homeScreen/view/screen_home.dart';
import '../model/register_reponsce_model.dart';
import '../model/update_responce_model/list_element.dart';
import '../model/update_responce_model/update_responce_model.dart';
import '../model/update_user_response_model/update_user_response_model.dart';
import '../repositry/reigister_repositry.dart';
import '../repositry/reigister_update_repo.dart';

class ReigsterController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<File?> imageFile = Rx<File?>(null);
  var image;

  final homeController = Get.put(HomeListController());

  var formData;

  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final textcodeController = TextEditingController().obs;

  RxBool isUpdating = false.obs;
  RxBool isUpdate = false.obs;

  TextcontrollerClear() {
    nameController.value.clear();
    emailController.value.clear();
    mobileController.value.clear();
    textcodeController.value.clear();
  }

  RxList<ListElement> updateData = <ListElement>[].obs;

  createOrUpdate(String brancid) {
    if (brancid == '') {
      RegisterList();
    } else {
      updateDataList(brancid);
    }
  }

  picImageFromGallery(String brId) {
    if (brId == '') {
      getPicGallary();
    } else {
      getPicGallary();
    }
  }

  picImageFromCamera(String brId) {
    if (brId == '') {
      getPicCamera();
    } else {
      getPicCamera();
    }
  }

  //1) Register screen

  Future<void> RegisterList() async {
    log('---------------------------pick1');
    isLoading.value = true;

    formData = dio.FormData.fromMap({
      "name": nameController.value.text,
      "email": emailController.value.text,
      "mobile": mobileController.value.text,
      "textCode": textcodeController.value.text,
      "dataGuard": "[]",
      if (imageFile.value != null)
        "image": await dio.MultipartFile.fromFile(
          imageFile.value!.path,
          filename: imageFile.value!.path.split("/").last,
        )
    });

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
      TextcontrollerClear();
      Get.off(HomeScreen());
    });
    log('---------------------------pick4');
  }

//2) Update Screen with alredy exting values.

  Future<void> updateList(String id) async {
    isUpdating.value = true;

    Either<String, UpdateResponceModel> result =
        await UpdateRepo().updateList(id);

    isUpdating.value = false;

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 3),
            message: left,
            backgroundColor: Colors.red
            //  icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 3),
          message: 'welcome to registation deatils..',
          backgroundColor: Colors.green,
          icon: Icon(Icons.cancel_outlined),
        ),
      );

      updateData.addAll(right.data!.listElement!);

      //intially clear the textfiled controller becouse it may contain unwnated values
      TextcontrollerClear();
      nameController.value.text = right.data!.listElement![0].name.toString();
      emailController.value.text = right.data!.listElement![0].email.toString();
      mobileController.value.text =
          right.data!.listElement![0].mobile.toString();
      textcodeController.value.text =
          right.data!.listElement![0].tectCode.toString();
      image = homeController.mainData[0].globalGalleryDetails!.url ?? "";
      log(right.data!.listElement![0].name.toString());
      log(right.data!.listElement![0].email.toString());
      log(right.data!.listElement![0].mobile.toString());
      log(homeController.mainData[0].globalGalleryDetails!.url);
    });
  }

  //3) update screen after press button

  Future<void> updateDataList(String uId) async {
    isUpdate.value = true;
    isLoading.value = true;

    //upload data as form data

    formData = dio.FormData.fromMap({
      "branchId": uId,
      "name": nameController.value.text,
      "email": emailController.value.text,
      "mobile": mobileController.value.text,
      "textCode": textcodeController.value.text,
      "dataGuard": "[]",
      "image": await dio.MultipartFile.fromFile(
        imageFile.value!.path,
        filename: imageFile.value!.path.split("/").last,
      )
    });
    log('update==============${imageFile.value!.path}==================');
    log('${imageFile.value!.path.split("/").last}');

    final Either<String, UpdateUserResponseModel> result =
        await UpdateRepo().updateDataList(payload: formData);

    isUpdate.value = false;
    isLoading.value = false;
    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              message: left,
              isDismissible: true,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      Get.showSnackbar(const GetSnackBar(
        message: 'successfully updated',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        icon: Icon(Icons.check_circle_outline),
      ));

      Get.off(HomeScreen());
    });
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
