import 'dart:ui';

import 'package:get/get.dart';

showSnackBar(String title, String message, Color bgColor) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: bgColor);
}
