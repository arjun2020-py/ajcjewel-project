import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Utils/constains/constains.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/update_reg_controller.dart';
import '../model/update_auth_model/update_auth_model.dart';
import '../model/update_responce_model/update_responce_model.dart';
import '../model/update_user_response_model/update_user_response_model.dart';

final controller = Get.put(UpdateController());

class UpdateRepo {
  var dio = Dio();
  Future<Either<String, UpdateResponceModel>> updateList(
      String branchId) async {
    try {
      if (!kIsWeb) {
        bool isInterconnection =
            await InternetConnectionChecker().hasConnection;

        if (!isInterconnection) {
          return const Left('No Inernet Connection');
        }
      }
      Map<String, dynamic> dataList = {
        "sortType": 1,
        "sortOrder": 1,
        "statusArray": [1],
        "screenType": [],
        "responseFormat": [],
        "branchIds": [branchId],
        "limit": -1,
        "skip": -1,
        "searchingText": ""
      };
      final pref = await SharedPreferences.getInstance();
      final keyToken = pref.getString('loginToken');

      final response = await dio.post(
        updatedList,
        options: Options(headers: {
          'Authorization': keyToken,
          'Content-Type': "application/json",
        }),
        data: dataList,
      );
      log('${response}');
      return Right(UpdateResponceModel.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }

//update opertion repo.

  Future<Either<String, UpdateUserResponseModel>> updateDataList(
      {required UpdateAuthModel payload}) async {
    try {
      if (!kIsWeb) {
        bool isInternetConnection =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetConnection) {
          return Left('No internet connection');
        }
      }
      log('------------------------v1');
      final pref = await SharedPreferences.getInstance();
      final keyToken = pref.getString('loginToken');
      log('------------------------v3');

      var response = await dio.put('https://ajcjewel.com:5000/api/branch',
          options: Options(headers: {
            'Authorization': keyToken,
            'Content-Type': "application/json",
          }),
          data: payload);
      log('------------------------v2');

      return Right(UpdateUserResponseModel.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
