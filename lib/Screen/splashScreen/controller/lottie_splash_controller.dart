import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../homeScreen/view/screen_home.dart';
import '../../loginScreen/compents/desktop_screen.dart';
import '../../loginScreen/compents/mobile_screen.dart';
import '../../loginScreen/view/screen_login.dart';
import '../../responsiveWidget/reponsive_desgin.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 3));
    navigateToNextScreen();
    super.onInit();
  }

  void navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    // final authToken = prefs.getBool(key.toString());

    final loginToken = prefs.getString('loginToken');

    Widget nextScreen;

    if (loginToken == null || loginToken == false) {
      // User is logged in, navigate to home screen
      nextScreen =
          ResponsiveLayout(desktop: DesktopScreen(), mobile: MobileScreen());
    } else {
      // User is not logged in, navigate to login screen
      nextScreen = HomeScreen();
    }
    Get.off(nextScreen);
  }
}
