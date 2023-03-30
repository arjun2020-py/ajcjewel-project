import 'package:flutter/material.dart';

import '../controller/drop_down_controller.dart';

class DropdwonWidget extends StatelessWidget {
  const DropdwonWidget({
    super.key,
    required this.dropdownController,
  });

  final DropdwonController dropdownController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 300, bottom: 50),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(10),
        focusColor: Colors.blue,
        dropdownColor: const Color(0xff62CDFF),
        //isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down_sharp),
        items:
            dropdownController.list.value.map<DropdownMenuItem>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Center(child: Text(value)),
          );
        }).toList(),
        onChanged: (value) {
          dropdownController.changeLanuage(value);
          dropdownController.updateValue(value);
        },
        value: dropdownController.dropdwonValue.value,
      ),
    );
  }
}
