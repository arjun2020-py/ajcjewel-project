import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/delete_branch_response/delete_branch_response.dart';
import '../model/delete_requst_model/delete_requst_model.dart';
import '../model/update_model/home_updated_model.dart';

class HomeRepositry {
  var dio = Dio();

  // final data = [].obs;
  Future<Either<String, HomeResponseModel>> RegisterList(
      String searchTexts, var skip) async {
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
        "sortType": 1,
        "sortOrder": -1,
        "statusArray": [1],
        "screenType": [50],
        "responseFormat": [],
        "branchIds": [],
        "limit": 15,
        "skip": skip,
        "searchingText": searchTexts
      };

      //  {
      //   "sortType": 2,
      //   "sortOrder": 1,
      //   "statusArray": [1],
      //   "screenType": [],
      //   "responseFormat": [],
      //   "branchIds": [],
      //   "limit": 20,
      //   "skip": skip,
      //   "searchingText": searchTexts
      // };
      log('-------------------c2');

      final pref = await SharedPreferences.getInstance();
      final keyToken = pref.getString('loginToken');

      final response =
          await dio.post('https://ajcjewel.com:5000/api/branch/list',
              options: Options(headers: {
                'Authorization': keyToken,
                'Content-Type': "application/json",
              }),
              data: dataList);

      log('-------------------c8');

      // print('pa${jsonEncode(response.data)}');
      log('-------------------c4');

      final mainApiList = HomeResponseModel.fromJson(response.data);

      log('-------------------c10');

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

      return Right(HomeResponseModel.fromJson(response.data));
    } on DioError catch (dioError) {
      log('-------------------------c6');
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }

// delete oprtion:

  Future<Either<String, DeleteBranchResponse>> deleteOption(
      DeleteRequstModel model) async {
    try {
      if (!kIsWeb) {
        bool isInternetChecker =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetChecker) {
          return Left('No Internet Connection');
        }
      }
      final response = await dio.delete('https://ajcjewel.com:5000/api/branch',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: model);

      return Right(DeleteBranchResponse.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }

//switch clik option:

  Future<Either<String, DeleteBranchResponse>> switchOption(
      DeleteRequstModel model) async {
    try {
      if (!kIsWeb) {
        bool isInternetChecker =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetChecker) {
          return Left('No Internet Connection');
        }
      }
      final response = await dio.delete('https://ajcjewel.com:5000/api/branch',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: model);
      var switchData = DeleteBranchResponse.fromJson(response.data);

      return Right(switchData);
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
