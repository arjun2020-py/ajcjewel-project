import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.txt,
    required this.color,
    required this.txtSize
  });

  final String txt;
  final Color color;
  final double txtSize;

  @override
  Widget build(BuildContext context) {
    
    return Text(
      txt,
      style: TextStyle(color: color, fontSize: txtSize),
    );
  }
}