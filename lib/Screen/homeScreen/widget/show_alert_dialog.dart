import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_list_controller.dart';

final homeControler = Get.put(HomeListController());

Future<void> showAlertDiloag(
    BuildContext context, List<String>? branchId, int index) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Obx(
        () => AlertDialog(
          title: const Text('Delete Branch'),
          content: Text('Are you sure wanted to delete  branch?'),
          actions: [
            homeControler.isDeleting.value == true
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () {
                      homeControler.deleteOPtion(branchId);
                      homeControler.mainData.removeAt(index);
                      Get.back();
                    },
                    child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('No'))
          ],
        ),
      );
    },
  );
}
