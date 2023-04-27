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

class DesktopScreen extends StatelessWidget {
  DesktopScreen({super.key});
  final themController = Get.put(GetThemeController());
  final dropdownController = Get.put(DropdwonController());
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
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
              const Expanded(flex: 2, child: LottieSection(hieght: 300)),
              Expanded(
                flex: 3,
                child: LoginSection(
                  isDark: isDark,
                  loginController: loginController,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
