import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/model/create/register_response_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../repositry/home_repositry.dart';
import 'package:get/get.dart';

class HomeListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isData = false.obs;
  RxBool hasMore = true.obs;
  RxBool isMainApiPaginationLoading = false.obs;

  RxList<ListElement> mainData = <ListElement>[].obs;

  var searchController = TextEditingController();
  Future<void> registerList(int skip) async {
    isLoading.value = true;
    log('-------------a1');

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

      print('------$mainData--------');

      // print('$dataList');

      if (mainData.isEmpty && skip != 0) {
        const GetSnackBar(
          message: 'full  documents loaded',
        );
      }

      log('-----------------------b1');
      mainData; //contain list of data.
    });
    mainData.refresh();
    update();
  }

  var dataList = [].obs;

  // Future<void> removeData(String id) async {
  //   final dio = Dio();
  //   final response =
  //       await dio.delete('https://ajcjewel.com:5000/api/branch$id');
  //   if (response.statusCode == 200) {
  //     dataList.removeWhere((item) => item['id'] == id);
  //   }
  // }

  void removeSpecies(int id) {
    mainData.removeWhere((species) => species.id == id);
  }

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
    // refreshData();
    // onSearchText();
    log('working 000');
  }
}
