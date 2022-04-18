import 'package:flutter/material.dart';
import 'package:uniteca/view/pages/page.dart';
import 'package:uniteca/view/widgets/cards/occupation_card.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

/// The home page. This is the initial route of the application.
class _HomePageState extends PageState {
  final List<Widget> cards = [
    OccupationCard(),
  ];

  @override
  Widget getBody(BuildContext context) {
      return Center(
        child: ListView(
          children: cards,
        )
      );
  }
}