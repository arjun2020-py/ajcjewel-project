import 'dart:developer';

import 'package:first_app/Utils/commonWidget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Utils/helper/heleper.dart';
import '../controller/home_list_controller.dart';

class PagenationScreen extends StatefulWidget {
  const PagenationScreen({super.key});

  @override
  State<PagenationScreen> createState() => _PagenationScreenState();
}

class _PagenationScreenState extends State<PagenationScreen> {
  final pageController = Get.put(HomeListController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //  log('---------------5');

    scrollController.addListener(() {
      log('---------------5');

      if (scrollController.position.atEdge) {
        log('---------------3');

        //reachs the top of list .
        if (scrollController.position.pixels == 0) {
          log('---------------4');
          //reaches the bottom of list.
        } else {
          log('----------1');
          if (pageController.isMainApiPaginationLoading.value == false) {
            log('----------2');

            pageController.isMainApiPaginationLoading(true);

            pageController.registerList(pageController.mainData.length);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: TextWidget(txt: 'Pagenation', color: Colors.black, txtSize: 20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Align(
                  alignment: Alignment.bottomCenter,
                  child: pageController.isMainApiPaginationLoading.value == true
                      ? LottieBuilder.network(
                          'https://assets9.lottiefiles.com/packages/lf20_yK0dMpYzhT.json',
                          height: 200,
                          width: 200,
                        )
                      : LottieBuilder.network(
                          'https://assets3.lottiefiles.com/private_files/lf30_n7pcxz8z.json',
                          height: 200,
                          width: 200,
                        )),
            ),
            Obx(
              () => ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: pageController.mainData.length,
                itemBuilder: (BuildContext context, int index) {
                  var userList = pageController.mainData[index];
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(userList.name),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addHorizontalSpacing(10),
                              Text(userList.email),
                              addHorizontalSpacing(10),
                              Text(userList.mobile)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
