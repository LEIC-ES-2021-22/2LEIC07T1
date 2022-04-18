import 'package:flutter/material.dart';

/// Define a generic card. All cards made should inherit from AbstractCard.
abstract class AbstractCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CardState();
  }

  /// Decide what to do when the card is clicked.
  onTap(BuildContext context);

  /// Define the title of the card.
  String getTitle();

  /// Get the main content of the card as a widget.
  Widget getContent(BuildContext context);
}

class CardState extends State<AbstractCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTap(context),
        child: Card(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100.0),
                child: Container(
                    width: (double.infinity),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(widget.getTitle(),
                                style: Theme.of(context).textTheme.headline2),
                            widget.getContent(context),
                          ],
                        ))))));
  }
}
