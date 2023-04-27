import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_list_controller.dart';

class User {
  String name;
  bool invited;

  User({required this.name, this.invited = false});
}

List<User> users = [
  User(name: "John"),
  User(name: "Jane"),
  User(name: "Mike"),
];

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  final listController = Get.put(HomeListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => ListView.builder(
        itemCount: listController.mainData.length,
        itemBuilder: (BuildContext context, int index) {
          var data = listController.mainData[index];
          return ListTile(
            title: Text(data.name),
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  data.invited = true;
                });
              },
              child: Text(data.invited ? "Invited" : "Add friend"),
            ),
          );
        },
      ),
    ));
  }
}
