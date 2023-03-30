import 'package:flutter/material.dart';

class TextfiledWidget extends StatelessWidget {
  TextfiledWidget(
      {super.key,
      required this.txt,
      required this.icon,
      required this.controller,
      required this.vaildator});

  final String txt;
  final Widget icon;
  final TextEditingController controller;
  String? Function(String?)? vaildator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 450),
        child: TextFormField(
          validator: vaildator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: icon,
            hintText: txt,
          ),
        ),
      ),
    );
  }
}
