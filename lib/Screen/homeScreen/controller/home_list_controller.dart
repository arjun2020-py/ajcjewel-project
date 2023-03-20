import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/model/register_response_list.dart';
import 'package:flutter/material.dart';

// import '../../loginScreen/controller/login_controller.dart';
import '../repositry/home_repositry.dart';
import 'package:get/get.dart';

class HomeListController extends GetxController {
  RxBool isLoading = false.obs;
  RegsiterResponseListModel? regsiterResponseListModel;

  void registerList() async {
    isLoading.value = true;
    Either<String, RegsiterResponseListModel> result =
        await HomeRepositry().RegisterList();
    regsiterResponseListModel = result.right;
    final data = jsonEncode(regsiterResponseListModel);
    print(data);

    log(regsiterResponseListModel!.data.list.length.toString());
    // log('--------------00${re}');
    // final  data = jsonEncode(regsiterResponseListModel);

    isLoading.value = false;

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        message: 'Succssfully listed',
        icon: Icon(Icons.check_circle_sharp),
      ));
      log('-----------------------b1');
      regsiterResponseListModel = result.right;
    });
  }

  @override
  void onInit() {
    super.onInit();
    
  }

  void inalizeList() {
    registerList();
  }
}
