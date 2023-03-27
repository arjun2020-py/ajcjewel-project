import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/model/register_response_list.dart';
import 'package:flutter/material.dart';

import '../repositry/home_repositry.dart';
import 'package:get/get.dart';

class HomeListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isData = false.obs;
  RxBool hasMore = true.obs;
  RxBool isMainApiPaginationLoading = false.obs;

  RxList<ListElement> mainData = <ListElement>[].obs;

  RxList<ListElement> dataList = <ListElement>[].obs;
  RxInt currentPage = 1.obs;

  //for pagination

  var isMoreDataAvilabel = true.obs;

  var searchController = TextEditingController();
  Future<void> registerList(int skip) async {
    isLoading.value = true;
    log('-------------a1');

    Either<String, RegsiterResponseListModel> result =
        await HomeRepositry().RegisterList(searchController.text, skip);

    isMainApiPaginationLoading.value = false;

    isLoading.value = false;

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.cancel_outlined),
            )), (right) {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: Colors.green,
        message: 'Succssfully listed',
        icon: Icon(Icons.check_circle_sharp),
      ));

      if (skip == 0) {
        mainData.clear();
      }
      mainData.addAll(right.data.list);

      // mainData.addAll(right.data.list);
      final dataList = jsonEncode(mainData);

      log('------$mainData--------');

      // print('$dataList');

      if (dataList.isEmpty && skip != 0) {
        const GetSnackBar(
          message: 'full  documents loaded',
        );
      }

      log('-----------------------b1');
      mainData; //contain list of data.
    });
  }

  //function for pull and refrsh data from api.

  Future<void> refreshData() async {
    await registerList(0);
  }

  onSearchText() {
    mainData;
    registerList(0);
  }

  void inalizeList() {
    registerList(0);
    // refreshData();
    // onSearchText();
    log('working 000');
  }
}
