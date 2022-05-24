import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:intl/intl.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/model/entities/reservation.dart';



class RoomReservationsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RoomReservationsPageViewState();
}

class RoomReservationsPageViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, Tuple2<List<Reservation>, RequestStatus>>(
        converter: (store) {
      final List<Reservation> reservations =
          store.state.content['reservations'];
      return Tuple2(reservations, store.state.content['reservationsStatus']);
    }, builder: (context, reservationInfo) {
      return RequestDependentWidgetBuilder(
          context: context,
          status: reservationInfo.item2,
          contentGenerator: generateReservationPage,
          content: reservationInfo.item1,
          contentChecker:
              reservationInfo.item1 != null && reservationInfo.item1.isNotEmpty,
          onNullContent: Center(
              child: Text('Não há salas reservadas!',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center)));
    });
  }

  Widget generateReservationPage(reservations, BuildContext context) {
    final List<Widget> items = <Widget>[];

    items.add(PageTitle(name: 'Reserva de gabinetes'));

    for (var i = 0; i < reservations.length; i++) {
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
        scrollDirection: Axis.vertical, shrinkWrap: true, children: items);
  }

  Widget getRoom(Reservation reservation) {
    final String hours = (reservation.duration.inHours)
      .toString().padLeft(2, '0');
    final String minutes = (reservation.duration.inMinutes - 
      reservation.duration.inHours * 60)
      .toString().padLeft(2, '0');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(0x1c, 0, 0, 0),
              blurRadius: 7.0,
              offset: Offset(0.0, 1.0),
            )
          ]),
      child: Column(children: [
        Padding(padding: EdgeInsets.only(top: 6)),
        Container (
          alignment: Alignment.centerLeft,
          child: Text(reservation.room,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 20
              ))
        ),
        Padding(padding: EdgeInsets.all(15)),
        Container (
          alignment: Alignment.centerRight,
          child: Text('Data: ' + 
              DateFormat('dd-MM-yyyy').format(reservation.startDate)
              + ' às ' +
              DateFormat('kk:mm').format(reservation.startDate),
              style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w400
              ))
        ),
        Padding(padding: EdgeInsets.only(top: 4)),
        Container(
          alignment: Alignment.centerRight,
          child: Text('Duração: ${hours}h$minutes',
              style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400
              ))
        ),
      ]),
    );
  }
}
