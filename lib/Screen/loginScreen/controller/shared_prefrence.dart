// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthController extends GetxController {
//   final _isLoggedIn = false.obs;

//   bool get isLoggedIn => _isLoggedIn.value;

//   @override
//   void onInit() {
//     super.onInit();
//     checkLoginStatus();
//   }

//   checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var token = prefs.getString('auth_token');
//     if (token != null) {
//       _isLoggedIn.value = true;
//     }
//   }
// }
