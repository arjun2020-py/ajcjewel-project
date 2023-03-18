import 'package:first_app/Utils/helper/heleper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';
import '../../themes/controller/theme_controller.dart';
import '../controller/drop_down_controller.dart';
import '../controller/login_controller.dart';
import '../widget/dropdwon_widget.dart';
import '../widget/login_section.dart';
import '../widget/lottie_section.dart';
import '../widget/switch_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginController = Get.put(LoginController());
  final dropdownController = Get.put(DropdwonController());
  final themController = Get.put(GetThemeController());

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SwitchWidget(themController: themController, isDark: isDark),
                  DropdwonWidget(dropdownController: dropdownController)
                ],
              ),

              addVerticalSpacing(12),
              LottieSection(
                hieght: 300,
              ),
              //column
              LoginSection(isDark: isDark, loginController: loginController),
            ],
          ),
        ),
      ),
    );
  }
}
