import 'package:flutter/material.dart';
import 'package:uniteca/view/widgets/navigation_drawer.dart';
import 'package:uniteca/assets/constants.dart' as Constants;

class PageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(context),
      drawer: NavigationDrawer(),
    );
  }

  Widget getAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55.0),
      child: AppBar(
        title: TextButton(
          child: const Text ('Uniteca'),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, 
            '/' + Constants.navHome, (r) => false)
        ),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return Container();
  }
}