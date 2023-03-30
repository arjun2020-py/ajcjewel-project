import 'package:first_app/Screen/loginScreen/controller/login_controller.dart';
import 'package:first_app/Screen/themes/constaines/theme_constaines.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

import 'Screen/splashScreen/controller/lottie_splash_controller.dart';
import 'Screen/splashScreen/view/splash_view.dart';

// const save_key =

// "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTY3OTAyNzM1MiwiZXhwIjoxNzEwNTYzMzUyfQ.HrgcV4hruVO48DcWjAOvdN9hI1z_vzTmXb5aP1cDx8s";

final authController = Get.put(LoginController());

final key = authController.loginResponseModel?.token;

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SplashScreen(),
      // initialRoute: ,
      initialBinding: BindingsBuilder(() {
        Get.put<SplashController>(SplashController());
      }),

      // initialRoute: _authController.isLoggedIn ? '/home' : '/login',
      // getPages: [
      //   GetPage(
      //     name: '/',
      //     page: () => SplashScreen(),
      //   ),
      //   GetPage(
      //     name: '/login',
      //     page: () => LoginScreen(),
      //   ),
      //   GetPage(
      //     name: '/home',
      //     page: () => HomeScreen(),
      //   )
      // ],
    );
  }
}
