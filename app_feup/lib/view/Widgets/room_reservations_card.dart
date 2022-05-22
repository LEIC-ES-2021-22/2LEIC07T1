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

  RoomReservations.fromEditingInformation(Key key, bool editingMode,
      Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  String getTitle() => 'Booked Rooms';

  @override
  onClick(BuildContext context) =>
      Navigator.pushNamed(context, '/' + Constants.navRooms);

  @override
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, Tuple2<String, RequestStatus>>(
        converter: (store) => Tuple2(
            'one',
            RequestStatus.none),
        builder: (context, room) {
          return RequestDependentWidgetBuilder(
              context: context,
              status: room.item2,
              contentGenerator: generateRoom,
              content: room.item1,
              contentChecker:
              room.item1 != null && room.item1.isNotEmpty,
              onNullContent: Center(
                  child: Text('Não existem dados para apresentar',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center)));
        });
  }



  Widget generateRoom(occupations, context) {

    final r = Reservation("Room B001",DateTime.parse('2022-05-16 16:00'),
        Duration(hours: 1));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Column(
            children: <Widget>[



              Text(r.room, textAlign: TextAlign.left),
              Text(DateFormat('dd-MM-yyyy hh:mm')
                  .format(r.startDate), textAlign: TextAlign.center),
              Text(r.duration.toString(), textAlign: TextAlign.center)

            ],
          ),
        )
      ],
    );
  }
}
