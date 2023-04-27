import 'dart:developer';

import 'package:first_app/Screen/loginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../ReportScreen/report_screen.dart';
import '../../dataGridScreen/sfdata_grid_screen.dart';
import '../../reigisterScreen/controller/reigster_controller.dart';
import '../../reigisterScreen/view/view_page.dart';
import '../controller/home_list_controller.dart';
import '../widget/show_alert_dialog.dart';
import 'auto_complte.dart';
import 'data_table_paginatiion.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final listController = Get.put(HomeListController());
  final regController = Get.put(ReigsterController());
  // final updateController = Get.put(UpdateController());

  var brId;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    log('---------------------------------p1');
    super.initState();
    Future.delayed(Duration.zero, () async {
      listController.refreshData();
    });
    log('start point ');
    scrollController.addListener(() {
      log('working 9');
      if (scrollController.position.atEdge) {
        log('working 8');
        // Reaches top of list.
        if (scrollController.position.pixels == 0) {
          log('working 5');
          //Reaches bottom of list.
          // const Center(child: CircularProgressIndicator());
        } else {
          log('working 0');
          if (listController.isMainApiPaginationLoading.value == false) {
            log('working');
            listController.isMainApiPaginationLoading(true);
            listController.registerList(listController
                .mainData.length); // convert list length to integer
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
        centerTitle: true,
        title: const Text('Branch'),
        actions: [
          IconButton(
              onPressed: () {
                //Get.to(UserTable());
              },
              icon: Icon(Icons.tab_rounded)),
          IconButton(
              onPressed: () {
                Get.to(DataGridScreen());
              },
              icon: Icon(Icons.pages_rounded)),
          IconButton(
              onPressed: () {
                Get.to(AutoComplteScreen());
              },
              icon: Icon(Icons.auto_awesome_mosaic)),
          IconButton(
              onPressed: () async {
                SharedPreferences prfs = await SharedPreferences.getInstance();
                await prfs.clear();

                Get.to(LoginScreen());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          regController.TextcontrollerClear();
          Get.to(ViewPageScreen(
            barnchId: '',
          ));
        },
        child: const Icon(Icons.app_registration),
      ),
      body: Column(children: [
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
        Expanded(
          child: RefreshIndicator(
            onRefresh: listController.refreshData,
            child: Obx(
              () => Stack(
                children: [
                  Stack(
                    children: [
                      //  Text('data'),

                      ListView.builder(
                          controller: scrollController,
                          itemCount: listController.mainData.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final data = listController.mainData[index];

                            return (listController.mainData.isEmpty &&
                                    listController.isLoading.value == false &&
                                    listController
                                            .isMainApiPaginationLoading.value ==
                                        false)
                                ? Text('data')
                                : Slidable(
                                    endActionPane: ActionPane(
                                        motion: const BehindMotion(),
                                        children: [
                                          SlidableAction(
                                            backgroundColor: Colors.green,
                                            icon: Icons.update,
                                            label: 'Update',
                                            onPressed: (context) {
                                              Get.to(ViewPageScreen(
                                                barnchId: data.id,
                                              ));
                                              log('updation statred');
                                              //  log('--${data.id}=====');
                                            },
                                          ),
                                          SlidableAction(
                                            backgroundColor: Colors.red,
                                            icon: Icons.delete,
                                            label: 'Delete',
                                            onPressed: (context) {
                                              showAlertDiloag(
                                                  context, [data.id], index);
                                            },
                                          )
                                        ]),
                                    child: Card(
                                      child: ListTile(
                                        leading: Stack(
                                          children: [
                                            CircleAvatar(
                                                radius: 30,
                                                child: ClipOval(
                                                    child:
                                                        data.globalGalleryDetails !=
                                                                null
                                                            ? Image.network(
                                                                data.globalGalleryDetails!
                                                                    .url,
                                                                fit: BoxFit
                                                                    .cover,
                                                                height: 100,
                                                                width: 100,
                                                              )
                                                            : Image.network(
                                                                'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                                fit: BoxFit
                                                                    .cover,
                                                                height: 100,
                                                                width: 100,
                                                              ))),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, left: 30),
                                            )
                                          ],
                                        ),
                                        title: Text(data.name),
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data.email),
                                            Text(data.mobile),
                                          ],
                                        ),
                                        trailing: Switch(
                                          value: listController
                                              .mainData[index].invited == false,

                                          activeColor: Colors.greenAccent,
                                          inactiveTrackColor: Colors.redAccent,
                                          // onChanged: toggleSwitch
                                          onChanged: (bool value) {
                                            var item =
                                                listController.mainData[index];
                                            item.invited = value;
                                            listController.seletedValue(
                                                index, data);
                                          },
                                        ),
                                      ),
                                    ));
                          }),
                      if (listController.switchState.value == true)
                        LinearProgressIndicator(
                          color: Colors.black,
                        )
                    ],
                  ),
                  if (listController.isMainApiPaginationLoading.value == true)
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Lottie.network(
                          'https://assets10.lottiefiles.com/packages/lf20_rwq6ciql.json',
                          height: 150,
                          width: 150,
                          repeat: true,
                          reverse: true,
                        )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

siginout() async {
  SharedPreferences prfs = await SharedPreferences.getInstance();
  await prfs.clear();

  Get.to(LoginScreen());
}
