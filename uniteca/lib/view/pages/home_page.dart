import 'package:flutter/material.dart';
import 'package:uniteca/view/widgets/navigation_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              child: Text('Made by:', style: TextStyle(fontSize: 30)),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
            Padding(
              child: Text('André Barbosa', style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  ),
            Padding(
              child: Text('Francisco Nunes', style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  ),
            Padding(
              child: Text('Guilherme Almeida', style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  ),
            Padding(
              child: Text('João Pereira', style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  ),
            Padding(
              child: Text('Luís Rodrigues', style: TextStyle(fontSize: 18)),
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}