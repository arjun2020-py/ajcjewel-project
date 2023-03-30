import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Screen/reigisterScreen/model/reigister_auth_model.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../model/register_reponsce_model.dart';

class ReigsterRepositry {
  var dio = Dio();
  Future<Either<String, RegisterResponceModel>> Register(
      RegisterAuthModel model) async {
    try {
      if (!kIsWeb) {
        bool isInternetChecker =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetChecker) {
          return const Left('No Internet Connection');
        }
      }
      Response<dynamic> response =
          await dio.post('https://ajcjewel.com:5000/api/branch',
              options: Options(headers: {
                HttpHeaders.contentTypeHeader: "application/json",
              }),
              data: model);

      return Right(RegisterResponceModel.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
