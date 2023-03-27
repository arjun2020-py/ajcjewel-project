import 'dart:developer';

import 'package:first_app/Screen/homeScreen/view/pagenation_screen.dart';
import 'package:first_app/Screen/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../reigisterScreen/controller/reigster_controller.dart';
import '../../reigisterScreen/view/view_page.dart';
import '../controller/home_list_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listController = Get.put(HomeListController());
  final regController = Get.put(RegisterController());

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    listController.inalizeList();
    log('working 99');
    // scrollController.addListener(() {
    //   log('working 9');
    //   if (scrollController.position.atEdge) {
    //     log('working 8');
    //     // Reaches top of list.
    //     if (scrollController.position.pixels == 0) {
    //       log('working 5');
    //       //Reaches bottom of list.
    //       // const Center(child: CircularProgressIndicator());
    //     } else {
    //       log('working 0');
    //       if (listController.isMainApiPaginationLoading.value == false) {
    //         log('working');
    //         listController.isMainApiPaginationLoading(true);
    //         listController.registerList(listController.mainData.length);
    //       }
    //     }
    //   }
    // }
    // );
  }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Branch'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(PagenationScreen());
              },
              icon: Icon(Icons.pages_rounded)),
          IconButton(
              onPressed: () async {
                SharedPreferences prfs = await SharedPreferences.getInstance();
                await prfs.clear();

                Get.to(LoginScreen());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          TextFormField(
            autofocus: true,
            onChanged: (value) {
              listController.onSearchText();
            },
            controller: listController.searchController,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search here..',
                suffixIcon: IconButton(
                    onPressed: () {
                      listController.searchController.text = '';
                      listController.onSearchText();
                    },
                    icon: const Icon(Icons.cancel_outlined)),
                filled: true,
                fillColor: Colors.white),
          ),
          // Text('data'),
          //Obx(
//() =>
          // listController.isLoading.value == true
          //    ? Lottie.network(
//'https://assets5.lottiefiles.com/packages/lf20_qlwqp9xi.json',
          // height: 300,
          //    width: 300)
//:
          RefreshIndicator(
            onRefresh: listController.refreshData,
            child: RefreshIndicator(
              onRefresh: listController.refreshData,
              child: Column(
                children: [
                  Obx(
                    () => ListView.builder(
                        itemCount: listController.mainData.length,
                        // itemCount: 10,
                        controller: scrollController,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final data = listController.mainData[index];

                          // return Text('data2');
                          return Card(
                            child: ListTile(
                              title: Text(data.name),
                              subtitle: Text(data.mobile),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ]), //
        //)
      ),
    );
    floatingActionButton:
    FloatingActionButton(
      onPressed: () {
        Get.to(ViewPageScreen());
      },
      child: const Icon(Icons.app_registration),
    );
  }
}

siginout() async {
  SharedPreferences prfs = await SharedPreferences.getInstance();
  await prfs.clear();

  Get.to(LoginScreen());
}
