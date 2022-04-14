import 'package:flutter/material.dart';
import 'package:uniteca/view/pages/home_page.dart';
import 'package:uniteca/assets/constants.dart' as Constants;
import 'package:uniteca/view/pages/occupation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      //home: HomePage(),
      initialRoute: '/' + Constants.navHome,
      routes: <String, WidgetBuilder> {
        '/' + Constants.navHome: (BuildContext context) => HomePage(),
        '/' + Constants.navOccupation: (BuildContext context) => OccupationPage()
      }
    );
  }
}
