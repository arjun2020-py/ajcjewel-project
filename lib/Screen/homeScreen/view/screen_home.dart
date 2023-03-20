import 'package:first_app/Screen/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../reigisterScreen/view/view_page.dart';
import '../controller/home_list_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listController = Get.put(HomeListController());
  @override
  void initState() {
    listController.inalizeList();
    //  listController.registerList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Branch'),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prfs = await SharedPreferences.getInstance();
                await prfs.clear();

                Get.to(LoginScreen());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(
        () => listController.isLoading.value == true
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount:
                    listController.regsiterResponseListModel!.data.list.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = listController
                      .regsiterResponseListModel!.data.list[index];
                  return Card(
                    child: ListTile(
                      title: Center(child: Text(data.name.toString())),
                      subtitle: Column(
                        children: [
                          Text(data.email.toString()),
                          Text(data.mobile)
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(ViewPageScreen());
        },
        child: const Icon(Icons.app_registration),
      ),
    );
  }
}

siginout() async {
  SharedPreferences prfs = await SharedPreferences.getInstance();
  await prfs.clear();

  Get.to(LoginScreen());
}
