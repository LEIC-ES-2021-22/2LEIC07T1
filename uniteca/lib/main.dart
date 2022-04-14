import 'package:flutter/material.dart';
import 'package:uniteca/view/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uniteca',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Uniteca'),
      routes: <String, WidgetBuilder> {
      }
    );
  }
}
