import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/delete_branch_response/delete_branch_response.dart';
import '../model/delete_requst_model/delete_requst_model.dart';
import '../model/update_model/home_updated_model.dart';
import '../repositry/home_repositry.dart';
import 'package:get/get.dart';

import '../view/screen_home.dart';

class HomeListController extends GetxController {
  // RxBool isValueChanged = false.obs;
  // RxBool isSerarched = false.obs;
  RxBool isDeleting = false.obs;
  RxBool isLoading = true.obs;
  RxBool hasMore = false.obs;
  RxBool isMainApiPaginationLoading = false.obs;
  var imageUrl;
  Rx<File?> imageFile = Rx<File?>(null);

  //for  the siwtch value.
  RxList<bool> switchValues = <bool>[].obs;

  RxList<ListElement> mainData = <ListElement>[].obs;

  final searchController = TextEditingController();
  //
  RxBool switchState = false.obs;
  RxBool loading = false.obs;

  seletedValue(int index, ListElement data) {
    if (data.invited == false) {
      data.invited == true;
      switchOption(
        [data.id],
        0,
      );
    } else {
      data.invited = false;

      switchOption(
        [data.id],
        1,
      );
    }
  }

  registerList(var skip) async {
    isLoading.value = true;
    isMainApiPaginationLoading.value = true;

    log('-----------------------pg1');

    Either<String, HomeResponseModel> result =
        await HomeRepositry().RegisterList(
      searchController.text,
      skip,
    );

    isMainApiPaginationLoading.value = false;
    isLoading.value = false;
    log('-----------------------pg2');

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      if (skip == 0) {
        mainData.clear();
      }
      mainData.addAll(right.data.list);

      var imageUrl = right.data.list[0].globalGalleryDetails!.url;

      log('-----------------------pg3');

      // mainData.addAll(right.data.list);
      final dataList = jsonEncode(mainData);

      print('aaa------$mainData--------');

      // print('$dataList');
      log('----------------------p2');

      mainData; //contain list of data.
    });
    mainData.refresh();
    update();
  }

  var dataList = [].obs;

  //function for pull and refrsh data from api.

  Future<void> refreshData() async {
    isMainApiPaginationLoading(true);
    mainData.clear();
    await registerList(0);

    // isMainApiPaginationLoading(true);
  }

  onSearchText() {
    mainData;
    registerList(0);
  }

  void inalizeList() {
    registerList(0);
  }

  @override
  void onInit() {
    super.onInit();
  }

  //delete branch from listview.

  DeleteBranchResponse? deleteBranchResponse;

  void deleteOPtion(List<String>? brId) async {
    isDeleting.value = true;
    Either<String, DeleteBranchResponse> result = await HomeRepositry()
        .deleteOption(DeleteRequstModel(branchIds: brId, status: 2));

    isDeleting.value = false;

    deleteBranchResponse = result.right;

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              isDismissible: true,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 3),
        message: 'Delete successfully',
        isDismissible: true,
        backgroundColor: Colors.green,
        icon: Icon(Icons.check_circle_outline_outlined),
      ));
      Get.off(HomeScreen());
    });
  }

  Future<void> switchOption(
    List<String>? brId,
    int? status,
  ) async {
    loading.value = true;
    switchState.value = !switchState.value;

    Either<String, DeleteBranchResponse> result = await HomeRepositry()
        .switchOption(DeleteRequstModel(branchIds: brId, status: status));

    loading.value = false;

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              isDismissible: true,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      // Get.showSnackbar(const GetSnackBar(
      //   duration: Duration(seconds: 3),
      //   message: 'Delete successfully',
      //   isDismissible: true,
      //   backgroundColor: Colors.green,
      //   icon: Icon(Icons.check_circle_outline_outlined),
      // ));
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
    Get.off(HomeScreen());
  }

  //delete opertion section:
}
