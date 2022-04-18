import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Color.fromARGB(0xff, 41, 41, 41),
  hintColor: Color.fromARGB(0xff, 65, 65, 65),

  cardColor: Color.fromARGB(0xff, 61, 61, 61),
  
  fontFamily: 'Poppins',

  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(0xff, 82, 82, 82),
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          primary: Colors.white,
          textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))),
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 22.0,
     fontWeight: FontWeight.bold, color: Colors.white),
    headline2: TextStyle(fontSize: 17.0,
     fontWeight: FontWeight.bold, color: Colors.white),
  )
);
