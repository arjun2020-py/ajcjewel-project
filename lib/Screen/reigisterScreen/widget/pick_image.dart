import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/reigster_controller.dart';
import '../controller/update_reg_controller.dart';
import '../view/view_page.dart';

class PickImageShow extends StatelessWidget {
  const PickImageShow({
    super.key,
    required this.widget,
    required this.registerController,
    required this.updateController,
  });

  final ViewPageScreen widget;
  final ReigsterController registerController;
  final UpdateController updateController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
          radius: 30,
          child: widget.barnchId == ''
              ? ClipOval(
                  child: Obx(() => registerController.imageFile.value != null
                      ? Image.file(
                          registerController.imageFile.value!,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        )
                      : Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        )))
              : Obx(() => updateController.imageFile.value != null
                  ? Image.file(
                      updateController.imageFile.value!,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )
                  : Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ))),
    );
  }
}
