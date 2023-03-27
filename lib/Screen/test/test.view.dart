// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../homeScreen/controller/home_list_controller.dart';

// class TestScreen extends StatefulWidget {
//   TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   final controller = Get.put(HomeListController());

//   @override
//   void initState() {
//     refreshData();
//     super.initState();
//   }

//   Future refreshData() async {
//     Future.delayed(Duration(seconds: 2));
//     var data = jsonEncode(controller.mainData);

//     setState(() {
//       // data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//         () => RefreshIndicator(
//           onRefresh: refreshData,
//           child: ListView.builder(
//             itemCount: controller.mainData.length,
//             itemBuilder: (BuildContext context, int index) {
//               var value = controller.mainData[index];
//               return Card(
//                 child: ListTile(
//                   title: Text(value.name),
//                   subtitle: Text(value.mobile),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
