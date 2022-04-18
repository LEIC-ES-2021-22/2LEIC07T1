import 'package:flutter/material.dart';
import 'package:uniteca/view/widgets/cards/card.dart';
import 'package:uniteca/assets/constants.dart' as Constants;

/// Displays the current occupation in a card.
class OccupationCard extends AbstractCard {
  @override
  onTap(BuildContext context) {
      Navigator.pushNamed(context, '/' + Constants.navOccupation);
    }

  @override 
  String getTitle() {
    return 'Occupation';
  }

  @override 
  Widget getContent(BuildContext context) {
    return Text('This is the occupation.');
  }

}