// import 'dart:developer';

// import 'package:first_app/Utils/commonWidget/text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// import '../../../Utils/helper/heleper.dart';
// import '../controller/home_list_controller.dart';

// class PagenationScreen extends StatefulWidget {
//   const PagenationScreen({super.key});

//   @override
//   State<PagenationScreen> createState() => _PagenationScreenState();
// }

// class _PagenationScreenState extends State<PagenationScreen> {
//   final pageController = Get.put(HomeListController());
//   ScrollController scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();

//     scrollController.addListener(() {
//       log('---------------1');

//       if (scrollController.position.atEdge) {
//         log('---------------2');

//         //reachs the top of list .
//         if (scrollController.position.pixels == 0) {
//           log('---------------3');
//           //reaches the bottom of list.
//         } else {
//           log('----------4 pagination happened');
//           if (pageController.isMainApiPaginationLoading.value == false) {
//             log('----------5');

//             pageController.isMainApiPaginationLoading(true);

//             pageController.registerList(pageController.swatichList!.length);
//           }
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     /* return Scaffold(
//       appBar: AppBar(
//         title: Text("pagination".tr),
//       ),
//       body: ListView.builder(
//         controller: scrollController,
//         itemCount: 20,
//         itemBuilder: (context, index) => ListTile(
//           title: Text("Row at " + index.toString()),
//         ),
//       ),
//     );*/

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(Icons.arrow_back)),
//         title: TextWidget(txt: 'Pagenation', color: Colors.black, txtSize: 20),
//         centerTitle: true,
//       ),
//       body: Obx(
//         () => Stack(
//           children: [
//             Obx(
//               () => ListView.builder(
//                 controller: scrollController,
//                 shrinkWrap: true,
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 itemCount: pageController.mainData.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var userList = pageController.mainData[index];
//                   return Card(
//                     child: Column(
//                       children: [
//                         ListTile(
//                           title: Text(userList.name),
//                           subtitle: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               addHorizontalSpacing(10),
//                               Text(userList.email),
//                               // addHorizontalSpacing(10),
//                               // Text(userList.mobile)
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             if (pageController.isMainApiPaginationLoading.value == true)
//               Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Lottie.asset(
//                     'assets/images/98194-loading.json',
//                     height: 150,
//                     width: 150,
//                     repeat: true,
//                     reverse: true,
//                   )),
//           ],
//         ),
//       ),
//     );
//   }
// }
