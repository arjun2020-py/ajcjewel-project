import 'package:flutter/material.dart';

//light theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 240, 125, 75),

  //appbar style
  appBarTheme: const AppBarTheme(
    color: Color(0xffF2921D),
    titleTextStyle: TextStyle(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
  ),

  //elevebutton style
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    //
    shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffF2921D)),
  )),

  //textfromfiled style

  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.2)),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black, selectionColor: Colors.blue.shade300),
);

//dark theme
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    //switch widget style
    switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all<Color>(Colors.grey),
        thumbColor: MaterialStateProperty.all<Color>(Colors.white)),

    //appbar widget style
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 29, 242, 238),
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
    ),

    //elevtedButton style

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      //
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color.fromARGB(255, 29, 242, 238),
      ),
    )),

    //textfiled style

    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: Colors.white10.withOpacity(0.2)),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Color.fromARGB(255, 115, 100, 246)));
