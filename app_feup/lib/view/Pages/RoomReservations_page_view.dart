import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/room_reservations_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uni/utils/constants.dart' as Constants;

//import 'secondary_page_view.dart';

class RoomReservationsPageView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RoomReservationsPageViewState();
}

class RoomReservationsPageViewState extends GeneralPageViewState {

  @override
  Widget getBody(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        children: <Widget>[
          PageTitle(name: 'Rooms Reservations'),

          getRoom("Room B001","15/03/22 ás 18:40","3 horas"),
          getRoom("Room B002","12/04/22 ás 19:40","1 hora"),


          MaterialButton(
            color: Color.fromARGB(255, 0x75, 0x17, 0x1e),
            shape: const CircleBorder(),
            onPressed: () {
              // go to page created by joao and guilherme
            },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '+',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          )

        ]);
  }

    Widget getRoom(String room, String startdate, String duration) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


        Container (
          child:
           Container(
            margin: EdgeInsets.symmetric(vertical: 8),
              height: 135.0,
               width: 300.0,
                padding: EdgeInsets.all(10.0),
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
              Padding(padding: EdgeInsets.only(top: 9)),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child:
                  Text(room,
                      textAlign: TextAlign.left,
                      style:
                      TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 0x75, 0x17, 0x1e)
                      ))
                ),
              ),
             Padding(padding: EdgeInsets.all(15)),
              Align(
                alignment: Alignment.centerRight,
                  child: Container(
                    child:
                  Text(startdate,
                      style:
                      TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold))
              ),
              ),
        Padding(padding: EdgeInsets.only(top: 4)),

              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    child:
                    Text(duration,
                        textAlign: TextAlign.right,
                        style:
                        TextStyle(
                            fontSize: 20))
                ),
              ),
        ]
        ),
        ),
        ),




            ]
        );
      }
    }