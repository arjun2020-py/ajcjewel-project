import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/heleper.dart';
import '../../themes/controller/theme_controller.dart';
import '../controller/drop_down_controller.dart';
import '../controller/login_controller.dart';
import '../widget/dropdwon_widget.dart';
import '../widget/login_section.dart';
import '../widget/lottie_section.dart';
import '../widget/switch_widget.dart';

class MobileScreen extends StatelessWidget {
  MobileScreen({super.key});
  final themController = Get.put(GetThemeController());
  final dropdownController = Get.put(DropdwonController());
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SwitchWidget(
                  isDark: isDark,
                  themController: themController,
                ),
                DropdwonWidget(
                  dropdownController: dropdownController,
                ),
              ],
            ),
            addVerticalSpacing(12),
            LottieSection(
              hieght: 300,
            ),
            LoginSection(
              isDark: isDark,
              loginController: loginController,
            )
          ],
        ),
      ),
    );
  }
}
