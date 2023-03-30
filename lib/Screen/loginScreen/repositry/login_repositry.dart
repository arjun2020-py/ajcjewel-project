import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../Utils/constains/constains.dart';
import '../../../Utils/expection/expection.dart';
import '../model/login_auth_model.dart';
import '../model/login_response_model.dart';

class LoginRepositry {
  var dio = Dio();

  Future<Either<String, LoginResponseModel>> login(LoginAuthModel modle) async {
    try {
      if (!kIsWeb) {
        bool isInternetChecker =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetChecker) {
          return Left('No Internet Connection');
        }
      }
      final reponse = await dio.post(loginApi,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: modle
          // {"mobile": "9961005004" , "password": "123456"}
          );

      return Right(LoginResponseModel.fromJson(reponse.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
