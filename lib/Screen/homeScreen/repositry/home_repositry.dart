import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/model/register_response_list.dart';
import 'package:first_app/Screen/loginScreen/widget/login_section.dart';
import 'package:first_app/Screen/reigisterScreen/model/register_reponsce_model.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/constains/constains.dart';
import '../../../main.dart';
import '../../loginScreen/controller/login_controller.dart';

class HomeRepositry {
  var dio = Dio();
  final loginController = Get.put(LoginController());

  Future<Either<String, RegsiterResponseListModel>> RegisterList() async {
    try {
      if (!kIsWeb) {
        bool isInternetConnection =
            await InternetConnectionChecker().hasListeners;

        if (!isInternetConnection) {
          return Left('No internet connection');
        }
      }
      Map<String, Object> dataList = {
        "sortType": 1,
        "sortOrder": 1,
        "statusArray": [1],
        "screenType": [],
        "responseFormat": [],
        "branchIds": [],
        "limit": 10,
        "skip": 0,
        "searchingText": ""
      };
      final tokens =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTY3OTMwMDEwMSwiZXhwIjoxNzEwODM2MTAxfQ.23FjTb4mtTQagHdjidfrx-XbkL3BburlO1OFCaQTgVA";
      log('token ${tokens}-----');
      final shardPref = await SharedPreferences.getInstance();
      final token = shardPref.getBool(key.toString());
      // final tokens = controller.loginResponseModel!.token;
      final response = await dio.post(registerList,
          options: Options(headers: {
          
            'Authorization':
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTY3OTMwMDEwMSwiZXhwIjoxNzEwODM2MTAxfQ.23FjTb4mtTQagHdjidfrx-XbkL3BburlO1OFCaQTgVA',
            'Content-Type': "application/json",
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          //s
          data: dataList);
      return Right(RegsiterResponseListModel.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
