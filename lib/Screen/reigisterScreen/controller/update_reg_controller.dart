import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/home_scrren.dart';
import 'package:first_app/Screen/reigisterScreen/controller/reigster_controller.dart';
import 'package:first_app/Screen/reigisterScreen/model/update_auth_model/update_auth_model.dart';
import 'package:first_app/Screen/reigisterScreen/model/update_responce_model/update_responce_model.dart';
import 'package:first_app/Screen/reigisterScreen/model/update_user_response_model/update_user_response_model.dart';
import 'package:first_app/Screen/reigisterScreen/repositry/reigister_update_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../model/update_responce_model/list_element.dart';

class UpdateController extends GetxController {
  RxBool isUpdating = false.obs;
  RxBool isLoading = false.obs;
  RxBool isUpdate = false.obs;

  RxList<ListElement> updateData = <ListElement>[].obs;
  String? barnchId;
  final controllr = Get.put(RegisterController());

  Future<void> updateList(String id) async {
    isUpdating.value = true;
    log('-------------a1');

    Either<String, UpdateResponceModel> result =
        await UpdateRepo().updateList(id);

    isUpdating.value = false;
    log('-------------a2');
    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      log('-------------a3');

      updateData.addAll(right.data!.listElement!);

      log('-------------a');
      // mainData.addAll(right.data.list);
      final dataList = jsonEncode(updateData);
      log('-1-1-1${dataList}1-1--1');

      controllr.nameController.text = updateData[0].name.toString();
      controllr.emailController.text = updateData[0].email.toString();
      controllr.mobileController.text = updateData[0].mobile.toString();
      controllr.textcodeController.text = updateData[0].tectCode.toString();

      log('------${dataList}--------');
    });
  }

  //update opertion controller.

  Future<void> updateDataList(String uId) async {
    isUpdate.value = true;
    var data = UpdateAuthModel.create(
        branchId: uId,
        name: controllr.nameController.text,
        email: controllr.emailController.text,
        mobile: controllr.mobileController.text,
        textCode: controllr.textcodeController.text,
        dataGuard: []);

    final Either<String, UpdateUserResponseModel> result =
        await UpdateRepo().updateDataList(payload: data);

    isUpdate.value = false;

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              message: left,
              isDismissible: true,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      Get.showSnackbar(const GetSnackBar(
        message: 'succssfully updated',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
        icon: Icon(Icons.check_circle_outline),
      ));
      Get.to(HomeScreen());
    });
  }
}
