
import 'dart:convert';

import 'package:dio/dio.dart';

class DioErrorResponseString {
  static getErrorString(dioError) {
    var returnString = "Something went wrong.!";
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        returnString = "Connection timeout error Occured";
        break;
      case DioErrorType.sendTimeout:
        returnString = "Send timeout error Occured";
        break;

      case DioErrorType.receiveTimeout:
        returnString = "Receive timeout error Occured";
        break;

      case DioErrorType.response:
        returnString = dioError.response!.statusMessage!;
        break;

      case DioErrorType.cancel:
        returnString = "Cancel error Occured";
        break;

      case DioErrorType.other:
        returnString = "Something went wrong..!";
        break;
    }

    if (dioError.type == DioErrorType.response &&
        dioError.response!.statusCode == 500) {
      returnString = jsonDecode(dioError.response!.toString())["message"];
    }

    return returnString;
  }
}