import 'package:flutter/material.dart';
import 'package:uniteca/view/pages/page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends PageState {
  @override
  Widget getBody(BuildContext context) {
      return Center(
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
      );
  }
}