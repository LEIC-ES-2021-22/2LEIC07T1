import 'package:flutter/material.dart';
import 'package:uniteca/assets/constants.dart' as Constants;

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<String> drawerItems = [
      Constants.navHome,
      Constants.navOccupation,
    ];

  void onTap(String item) {
    if (item == Constants.navHome) {
      Navigator.pushNamedAndRemoveUntil(
        context, '/' + item, (r) => false);
    } else if ('/' + item != ModalRoute.of(context).settings.name) {
      Navigator.popAndPushNamed(context, '/' + item);
    } else {
      Navigator.pop(context);
    }
  }

  Widget createDrawerItem(String item) {
    return ListTile (
      contentPadding: EdgeInsets.only(left: 25.0), 
      title: Text(item),
      onTap: () => onTap(item)
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];

    drawerItems.forEach((item) => items.add(createDrawerItem(item)));

    return Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 60.0),
          children: items)
    );
  }
}
