// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart' as dio;
// import 'package:either_dart/either.dart';
// import 'package:first_app/Screen/reigisterScreen/model/update_responce_model/update_responce_model.dart';
// import 'package:first_app/Screen/reigisterScreen/model/update_user_response_model/update_user_response_model.dart';
// import 'package:first_app/Screen/reigisterScreen/repositry/reigister_update_repo.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../homeScreen/view/screen_home.dart';
// import '../model/update_responce_model/list_element.dart';

// class UpdateController extends GetxController {
//   RxBool isUpdating = false.obs;
//   RxBool isUpdate = false.obs;

//   final nameController = TextEditingController().obs;
//   final emailController = TextEditingController().obs;
//   final mobileController = TextEditingController().obs;
//   final textcodeController = TextEditingController().obs;
//   RxBool isLoading = false.obs;
//   var formData;

//   //for image pick.

// //* The imageFile variable is wrapped in a Rx object, which allows it to be updated and observed in the UI.
//   Rx<File?> imageFile = Rx<File?>(null);
//   // var imageFile;

//   RxList<ListElement> updateData = <ListElement>[].obs;

//   TextcontrollerClear() {
//     nameController.value.clear();
//     emailController.value.clear();
//     mobileController.value.clear();
//     textcodeController.value.clear();
//   }

//   Future<void> updateList(String id) async {
//     isUpdating.value = true;

//     Either<String, UpdateResponceModel> result =
//         await UpdateRepo().updateList(id);

//     isUpdating.value = false;

//     result.fold(
//         (left) => Get.showSnackbar(GetSnackBar(
//             duration: const Duration(seconds: 3),
//             message: left,
//             backgroundColor: Colors.red
//             //  icon: const Icon(Icons.cancel_outlined),
//             )), (right) {
//       Get.showSnackbar(
//         const GetSnackBar(
//           duration: Duration(seconds: 3),
//           message: 'welcome to registation deatils..',
//           backgroundColor: Colors.green,
//           icon: Icon(Icons.cancel_outlined),
//         ),
//       );

//       updateData.addAll(right.data!.listElement!);
//       TextcontrollerClear();
//       nameController.value.text = right.data!.listElement![0].name.toString();
//       emailController.value.text = right.data!.listElement![0].email.toString();
//       mobileController.value.text =
//           right.data!.listElement![0].mobile.toString();
//       textcodeController.value.text =
//           right.data!.listElement![0].tectCode.toString();

//       log(right.data!.listElement![0].name.toString());
//       log(right.data!.listElement![0].email.toString());
//       log(right.data!.listElement![0].mobile.toString());
//     });
//   }

//   //update opertion controller.

//   Future<void> updateDataList(String uId) async {
//     isUpdate.value = true;
//     isLoading.value = true;

//     //upload data as form data

//     formData = dio.FormData.fromMap({
//       "branchId": uId,
//       "name": nameController.value.text,
//       "email": emailController.value.text,
//       "mobile": mobileController.value.text,
//       "textCode": textcodeController.value.text,
//       "dataGuard": "[]",
//       "image": await dio.MultipartFile.fromFile(
//         imageFile.value!.path,
//         filename: imageFile.value!.path.split("/").last,
//       )
//     });
//     log('update==============${imageFile.value!.path}==================');
//     log('${imageFile.value!.path.split("/").last}');

//     // final fields = formData.fields.asMap();
//     // final updateModel = UpdateAuthModel(
//     //   branchId: fields[0]?.value,
//     //   name: fields[1]?.value,
//     //   email: fields[2]?.value,
//     //   mobile: fields[3]?.value,
//     //   textCode: fields[4]?.value,
//     //   dataGuard: [],
//     // );

//     final Either<String, UpdateUserResponseModel> result =
//         await UpdateRepo().updateDataList(payload: formData);

//     isUpdate.value = false;
//     isLoading.value = false;
//     result.fold(
//         (left) => Get.showSnackbar(GetSnackBar(
//               message: left,
//               isDismissible: true,
//               duration: const Duration(seconds: 2),
//               backgroundColor: Colors.red,
//               icon: const Icon(Icons.cancel_outlined),
//             )), (right) {
//       Get.showSnackbar(const GetSnackBar(
//         message: 'successfully updated',
//         duration: Duration(seconds: 2),
//         backgroundColor: Colors.green,
//         icon: Icon(Icons.check_circle_outline),
//       ));

//       Get.off(HomeScreen());
//     });
//   }

//   //get image from mobile:

//   Future<void> getPicCamera() async {
//     final imagePicker1 = ImagePicker();
//     final pickimage1 = await imagePicker1.pickImage(source: ImageSource.camera);

//     if (pickimage1 != null) {
//       final file = File(pickimage1.path);
//       imageFile.value = file;
//     }
//     Get.back();
//   }

//   Future<void> getPicGallary() async {
//     final imagePicker2 = ImagePicker();
//     final XFile? pickimage2 =
//         await imagePicker2.pickImage(source: ImageSource.gallery);

//     if (pickimage2 != null) {
//       final file = File(pickimage2.path);
//       imageFile.value = file;
//     }
//     // log('------------${imageFile.value}---------');
//     Get.back();
//   }
// }
