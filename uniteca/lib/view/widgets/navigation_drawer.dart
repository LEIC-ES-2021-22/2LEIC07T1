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
      Navigator.pushNamedAndRemoveUntil(context, '/' + item, (r) => false);
    } else if ('/' + item != ModalRoute.of(context).settings.name) {
      Navigator.popAndPushNamed(context, '/' + item);
    } else {
      Navigator.pop(context);
    }
  }

  Widget createDrawerItem(String item) {
    var color = Theme.of(context).scaffoldBackgroundColor;
    if ('/' + item == ModalRoute.of(context).settings.name) {
      color = Theme.of(context).hintColor;
    }

    return ListTile(
      contentPadding: EdgeInsets.only(left: 25.0),
      title: Text(item),
      onTap: () => onTap(item),
      tileColor: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];

    drawerItems.forEach((item) => items.add(createDrawerItem(item)));

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Theme.of(context).scaffoldBackgroundColor
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 79.0),
           children: items)));
  }
}
