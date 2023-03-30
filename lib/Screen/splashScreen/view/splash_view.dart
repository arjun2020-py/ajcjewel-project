import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19A7CE),
      body: Center(
        child: Container(
            width: 200,
            height: 200,
            child: Lottie.asset(
              'assets/images/86752-wrong-intro.json',
            )),
      ),
    );
  }
}
