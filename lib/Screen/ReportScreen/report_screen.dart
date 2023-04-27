import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homeScreen/controller/home_list_controller.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
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
    super.initState();
  }

  final listController = Get.put(HomeListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      controller: scrollController,
      child: DataTable(
          border: TableBorder.all(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              style: BorderStyle.solid),
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.teal),
          dataRowHeight: 300,
          headingRowHeight: 100,
          columnSpacing: 20,
          dividerThickness: 5,
          showBottomBorder: true,
          columns: const [
            DataColumn(label: Text('Id')),
            DataColumn(label: Text('Image')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Mobile'))
          ],
          rows: List.generate(listController.mainData.length, (index) {
            print(listController.mainData.length);

            final image = listController.mainData[index].name;

            final name = listController.mainData[index].name;

            final email = listController.mainData[index].email;

            final mobile = listController.mainData[index].mobile;
            final id = listController.mainData[index].id;

            return DataRow(cells: [
              DataCell(Text(id)),
              DataCell(CircleAvatar(
                backgroundImage: NetworkImage(image),
              )),
              DataCell(Text(name)),
              DataCell(Text(email)),
              DataCell(Text(mobile))
            ]);
          })),
    ));
  }
}
