import 'package:flutter/material.dart';
import 'package:uniteca/view/widgets/navigation_drawer.dart';
import 'package:uniteca/assets/constants.dart' as Constants;

class PageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          child: const Text ('Uniteca', style: TextStyle(color: Colors.white)),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, 
            '/' + Constants.navHome, (r) => false)
        ),
      ),
      body: getBody(context),
      drawer: NavigationDrawer(),
    );
  }

  Widget getBody(BuildContext context) {
    return Container();
  }
}