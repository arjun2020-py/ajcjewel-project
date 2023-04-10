import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/constains/constains.dart';
import '../model/register_response_list.dart';

class CredRepo {
  var dio = Dio();

  // final data = [].obs;
  Future<Either<String, RegsiterResponseListModel>> RegisterList(
    String searchTexts,
  ) async {
    try {
      if (!kIsWeb) {
        bool isInternetConnection =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetConnection) {
          return const Left('no internet connection is avilabel');
        }
      }

      Map<String, dynamic> dataList = {
        "sortType": 2,
        "sortOrder": 1,
        "statusArray": [1],
        "screenType": [],
        "responseFormat": [],
        "branchIds": [],
        "limit": 10,
        "skip": 0,
        "searchingText": searchTexts
      };

      final pref = await SharedPreferences.getInstance();
      final keyToken = pref.getString('loginToken');

      final response = await dio.post(registerList,
          options: Options(headers: {
            'Authorization': keyToken,
            'Content-Type': "application/json",
          }),
          data: dataList);

      return Right(RegsiterResponseListModel.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
