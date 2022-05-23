import 'package:intl/intl.dart';
import 'package:uni/model/app_state.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/entities/reservation.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'generic_card.dart';
import 'package:uni/utils/constants.dart' as Constants;

/// Manages the library card section inside the personal area.
class RoomReservations extends GenericCard {
  RoomReservations({Key key}) : super(key: key);

  RoomReservations.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  String getTitle() => 'Reservas';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navRooms);

  @override
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, Tuple2<List<Reservation>, RequestStatus>>(
        converter: (store) => Tuple2(store.state.content['reservations'],
            store.state.content['reservationsStatus']),
        builder: (context, room) {
          return RequestDependentWidgetBuilder(
              context: context,
              status: room.item2,
              contentGenerator: generateRoom,
              content: room.item1,
              contentChecker: room.item1 != null && room.item1.isNotEmpty,
              onNullContent: Center(
                  child: Text('Não há salas reservadas!',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center)));
        });
  }

  Widget generateRoom(reservations, context) {
    final Reservation reservation = reservations[0];
    final String hours = (reservation.duration.inHours)
      .toString().padLeft(2, '0');
    final String minutes = (reservation.duration.inMinutes - 
      reservation.duration.inHours * 60)
      .toString().padLeft(2, '0');

    return Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).dividerColor, width: 0.6),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        width: double.infinity,
        child: Stack (
          children: <Widget>[
            Column (
              children: <Widget> [
                Text(DateFormat('dd/MM/yyyy').format(reservation.startDate),
                    //textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,),
                Text(DateFormat('kk:mm').format(reservation.startDate),
                    //textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,),
              ]
            ),
            Center (child: Text(reservation.room,
                //textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w400))),
            Container (
              alignment: Alignment.centerRight,
              child: Text('${hours}h$minutes',
                //textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,)),
          ],
        ));
  }
}
