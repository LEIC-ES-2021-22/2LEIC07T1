import 'package:flutter/material.dart';
import 'package:uniteca/view/pages/home_page.dart';
import 'package:uniteca/assets/constants.dart' as Constants;
import 'package:uniteca/view/theme.dart';
import 'package:uniteca/view/pages/occupation_page.dart';
import 'package:uniteca/view/widgets/navigation/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      initialRoute: '/' + Constants.navHome,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/' + Constants.navHome:
            return getPageTransition(HomePage());
          case '/' + Constants.navOccupation: 
            return getPageTransition(OccupationPage());
        }
        return null;
      }
    );
  }
}
