import 'package:flutter/material.dart';
import 'package:uniteca/view/widgets/navigation/navigation_drawer.dart';
import 'package:uniteca/assets/constants.dart' as Constants;

/// Generic page. Every page of the app should inherit from PageState.
class PageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: getBody(context),
      drawer: NavigationDrawer(),
    );
  }

  /// Create the top app bar.
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

  /// Create the main body of the page.
  Widget getBody(BuildContext context) {
    return Container();
  }
}