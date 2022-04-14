import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<String> drawerItems = [
      'Home',
      'Page 1'
    ];

  @override
  void initState() {
    super.initState();

  }

  Widget createDrawerItem(String item) {
    return ListTile (
      contentPadding: EdgeInsets.only(left: 25.0), 
      title: Text(item),
      onTap: () => (Navigator.pop(context))
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
