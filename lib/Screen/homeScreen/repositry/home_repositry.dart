import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/model/register_response_list.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/constains/constains.dart';

class HomeRepositry {
  var dio = Dio();

  // final data = [].obs;
  Future<Either<String, RegsiterResponseListModel>> RegisterList(
      String searchTexts, int skip) async {
    try {
      if (!kIsWeb) {
        bool isInternetConnection =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetConnection) {
          return const Left('no internet connection is avilabel');
        }
      }
      log('-------------------c1');
      Map<String, dynamic> dataList = {
        "sortType": 2,
        "sortOrder": 1,
        "statusArray": [1],
        "screenType": [],
        "responseFormat": [],
        "branchIds": [],
        "limit": 10,
        "skip": skip,
        "searchingText": searchTexts
      };
      log('-------------------c2');

      final pref = await SharedPreferences.getInstance();
      final keyToken = pref.getString('loginToken');

      final response = await dio.post(registerList,
          options: Options(headers: {
            'Authorization': keyToken,
            'Content-Type': "application/json",
          }),
          data: dataList);
      log('-------------------c4');

      final mainApiList = RegsiterResponseListModel.fromJson(response.data);
      if (mainApiList.data.list.isEmpty && skip != 0) {
        Fluttertoast.showToast(
            msg: 'full_document_loaded'.tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      log('-------------------c5');

      return Right(RegsiterResponseListModel.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
