import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/library_occupation_card.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UnitecaPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UnitecaPageViewState();
}

class UnitecaPageViewState extends GeneralPageViewState {
  @override

  Widget getBody(BuildContext context) {

      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget> [
          PageTitle(name: 'Uniteca'),

          LibraryOccupation(),

          PageTitle(name: 'Floors'),

          getFloors(1, 42.0, 87.2),
          getFloors(3, 23.0, 36.8),
          getFloors(5, 70.3, 12.0),
      ]);
  }

  Widget getFloors(int floor, double percentage1, double percentage2) {
     return Row(
        children: [

          Container (

            child:
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 150.0,
                width: 150.0,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration (
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(0x1c, 0, 0, 0),
                            blurRadius: 7.0,
                            offset: Offset(0.0, 1.0),
                        )
                    ]
                             ),
                child:
                    Column(
                          children: [
                              Text('Floor ' + floor.toString()),
                              Padding(padding: EdgeInsets.all(15)),
                              Text(percentage1.toString() + '%',
                                  style:
                                       TextStyle(
                                           fontSize: 22,
                                           fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.only(top: 28)),
                              Container(
                                        child: LinearPercentIndicator(
                                              lineHeight: 7.0,
                                              percent: percentage1 / 100,
                                              progressColor:
                                                    Theme.of(context).
                                                    accentColor,
                                        )
                              )
                          ]
                    ),
            ),
          ),

          Padding(padding: EdgeInsets.only(left: 12)),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        height: 150.0,
                        width: 150.0,
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration (
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Theme.of(context).primaryColor,
                                          boxShadow: [
                                                BoxShadow(
                                                color:
                                                    Color.
                                                    fromARGB(0x1c, 0, 0, 0),
                                                blurRadius: 7.0,
                                                offset: Offset(0.0, 1.0),
                                                )
                                          ]
                        ),
             child:
                  Column(
                      children: [
                            Text('Floor ' + (floor + 1).toString()),
                            Padding(padding: EdgeInsets.all(15)),
                            Text(percentage2.toString() + '%',
                                style:
                                    TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.only(top: 28)),
                            Container(
                                    child: LinearPercentIndicator(
                                            lineHeight: 7.0,
                                            percent: percentage2 / 100,
                                            progressColor:
                                                    Theme.of(context).
                                                    accentColor,
                                    )
                            )
                    ]
                   ),
          ),
        ]
     );
  }
}