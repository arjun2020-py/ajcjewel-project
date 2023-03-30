import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DropdwonController extends GetxController {
  final list = ['en', 'hi', 'fr'].obs;
  RxString dropdwonValue = 'en'.obs;

  changeLanuage(String value) {
    var local = Locale(value);
    Get.updateLocale(local);
  }

  updateValue(String value) {
    dropdwonValue.value = value;
    update();
  }
}
