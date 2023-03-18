import 'package:first_app/Screen/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Branch'),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prfs = await SharedPreferences.getInstance();
                await prfs.clear();

                Get.to(LoginScreen());
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.app_registration),
      ),
    );
  }
}

siginout() async {
  SharedPreferences prfs = await SharedPreferences.getInstance();
  await prfs.clear();

  Get.to(LoginScreen());
}
