import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Screen/homeScreen/model/register_response_list.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
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
      print("____s1");
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

      // const tokens =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTY3OTMwMDEwMSwiZXhwIjoxNzEwODM2MTAxfQ.23FjTb4mtTQagHdjidfrx-XbkL3BburlO1OFCaQTgVA";

      // final tokens = controller.loginResponseModel!.token;

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
