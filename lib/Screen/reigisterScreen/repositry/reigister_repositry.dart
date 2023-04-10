import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:first_app/Utils/expection/expection.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../model/register_reponsce_model.dart';

class ReigsterRepositry {
  var dio = Dio();
  Future<Either<String, RegisterResponceModel>> RegisterList(
      {required FormData payload}) async {
    log('------------------------------reg.....');
    try {
      if (!kIsWeb) {
        bool isInternetChecker =
            await InternetConnectionChecker().hasConnection;

        if (!isInternetChecker) {
          return const Left('No Internet Connection');
        }
      }
      log('-------------------------------register');
      final response = await dio.post('https://ajcjewel.com:5000/api/branch',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: payload);
      print('-------update${jsonEncode(response.data)}');

      return Right(RegisterResponceModel.fromJson(response.data));
    } on DioError catch (dioError) {
      // print('-------image${dioError.message}');
      // print('-------image${dioError.error}');
      // print('-------${dioError.response}');

      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
