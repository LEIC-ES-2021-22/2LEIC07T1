import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:intl/intl.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/Widgets/room_reservations_card.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:uni/model/entities/reservation.dart';

//import 'secondary_page_view.dart';

class RoomReservationsPageView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RoomReservationsPageViewState();
}

class RoomReservationsPageViewState extends GeneralPageViewState {

  @override
  Widget getBody(BuildContext context) {

    return StoreConnector<AppState, Tuple2<List<Reservation>,RequestStatus>>(
      converter:(store){
        final List<Reservation> reservations =
          store.state.content['reservations'];
        return Tuple2(reservations, store.state.content['reservationStatus']);

      },builder:(context, reservationInfo){
        return RequestDependentWidgetBuilder(
            context: context,
            status: reservationInfo.item2,
            contentGenerator: generateReservationPage,
            content: reservationInfo.item1,
            contentChecker: reservationInfo.item1 != null &&
                reservationInfo.item1.isNotEmpty,
            onNullContent: Center(
         child: Text('Não existem dados para apresentar',
                     style: Theme.of(context).textTheme.headline4,
                     textAlign: TextAlign.center)));

      }
    );
  }

  Widget generateReservationPage(reservations,BuildContext context){

    final List<Widget> items = <Widget>[];

    items.add(PageTitle(name: 'Rooms Reservations'));

    if(items.isEmpty){
      items.add(Text(
         'No booked Rooms',
        style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
      );
    }

    for(var i = 0; i < reservations.length; i++){
      items.add(getRoom(reservations[i]));
    }

    items.add(MaterialButton(
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
      ));

    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: items
    );
  }

  Widget getRoom(Reservation reservation){

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
                  Text(reservation.room,
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
                  Text(DateFormat('dd-MM-yyyy hh:mm')
                      .format(reservation.startDate),
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
                    Text(reservation.duration.toString(),
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