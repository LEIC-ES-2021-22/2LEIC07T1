import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/room_reservations_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

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

          RoomReservations(),

        ]);
  }
}