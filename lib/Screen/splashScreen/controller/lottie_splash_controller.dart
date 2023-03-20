import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../homeScreen/view/screen_home.dart';
import '../../loginScreen/view/screen_login.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 3));
    navigateToNextScreen();
    super.onInit();
  }

  void navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getBool(key.toString());
    //print(save_key);
    print(authToken);

    Widget nextScreen;

    if (authToken == null || authToken == false) {
      // User is logged in, navigate to home screen
      nextScreen = LoginScreen();
    } else {
      // User is not logged in, navigate to login screen
      nextScreen = HomeScreen();
    }
    Get.to(nextScreen);
  }
}
