import 'package:flutter/material.dart';
import 'package:uniteca/view/pages/page.dart';

class OccupationPage extends StatefulWidget {
  @override
  _OccupationPageState createState() => _OccupationPageState();
}

class _OccupationPageState extends PageState {
  @override
  Widget getBody(BuildContext context) {
    return Center(
      child: Text('Occupation')
    );
  }
}