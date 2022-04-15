import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Color.fromARGB(0xff, 50, 50, 50),
  hintColor: Color.fromARGB(0xff, 65, 65, 65),
  

  fontFamily: 'Poppins',

  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(0xff, 90, 90, 90),
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.white,
          textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))),
  iconTheme: IconThemeData(color: Colors.white),
);
