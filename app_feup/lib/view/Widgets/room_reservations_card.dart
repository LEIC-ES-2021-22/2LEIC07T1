import 'package:uni/model/app_state.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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
  String getTitle() => 'salas reservadas';

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

  Text txt = Text("rooms");

  Widget generateRoom(occupations, context) {
    return txt;
  }
}
