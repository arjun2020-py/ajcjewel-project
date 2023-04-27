import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_list_controller.dart';

class AutoComplteScreen extends StatefulWidget {
  AutoComplteScreen({super.key});

  @override
  State<AutoComplteScreen> createState() => _AutoComplteScreenState();
}

class _AutoComplteScreenState extends State<AutoComplteScreen> {
  String? seletcedDate;
  final listController = Get.put(HomeListController());

  final List<String> list = [
    'monday',
    'thuseday',
    'wensday',
    'thraday',
    'firday',
    'statuday',
    'sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Auto complete'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue value) {
              // When the field is empty
              if (value.text.isEmpty) {
                return [];
              }

              // The logic to find out which ones should appear
              return Future<Iterable<String>>(() async {
                final String query = value.text.toLowerCase();
                return listController.mainData
                    .where((listElement) =>
                        listElement.name.toLowerCase().contains(query))
                    .map((listElement) => listElement.name);
                // map to Iterable<String>
              });
            },
            onSelected: (value) {
              setState(() {
                seletcedDate = value;
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Text(seletcedDate.toString()),
        ],
      ),
    );
  }
}
