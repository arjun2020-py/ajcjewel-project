// import 'dart:typed_data';

// import 'package:flutter/material.dart';

// import '../controller/home_list_controller.dart';
// import '../model/update_model/home_updated_model.dart';

// class UserListTile extends StatelessWidget {
//   const UserListTile(
//       {super.key, required this.data, required this.homeListController});
//   final HomeListController homeListController;
//   final ListElement data;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           child: ClipOval(
//               child: homeListController.isLoading.value == true
//                   ? Image.network(data.globalGalleryDetails!.url)
//                   : Image.network(
//                       'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
//                       fit: BoxFit.cover,
//                       height: 100,
//                       width: 100,
//                     )),
//         ),
//         title: Text(data.name),
//         subtitle: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(data.email),
//             Text(data.mobile),
//           ],
//         ),
//       ),
//     );
//   }
// }
