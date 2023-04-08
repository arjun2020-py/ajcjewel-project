import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/model/register_response_list.dart';
import 'package:flutter/material.dart';

import '../repositry/home_repositry.dart';
import 'package:get/get.dart';

class HomeListController extends GetxController {
  RxBool isValueChanged = false.obs;
  RxBool isSerarched = false.obs;
  RxBool isDeleting = false.obs;
  RxBool isLoading = true.obs;
  RxBool hasMore = false.obs;
  RxBool isMainApiPaginationLoading = false.obs;

  RxList<ListElement> mainData = <ListElement>[].obs;

  var searchController = TextEditingController();
  Future<void> registerList(var skip) async {
    isLoading.value = true;
    isMainApiPaginationLoading.value = true;

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
      if (skip == 0) {
        mainData.clear();
      }
      mainData.addAll(right.data.list);

      // mainData.addAll(right.data.list);
      final dataList = jsonEncode(mainData);

      print('aaa------$mainData--------');

      // print('$dataList');
      log('-----------------------r1');

      if (mainData.isEmpty && skip != 0) {
        const GetSnackBar(
          message: 'full  documents loaded',
        );
      }
      log('-----------------------r2');

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

  //delete opertion section:
}
