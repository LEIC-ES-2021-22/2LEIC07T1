
import 'package:uni/model/app_state.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'generic_card.dart';

/// Manages the exam card section inside the personal area.
class LibraryOccupation extends GenericCard {
  LibraryOccupation({Key key}) : super(key: key);

  LibraryOccupation.fromEditingInformation(Key key, bool editingMode,
      Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  String getTitle() => 'Ocupação da biblioteca';

  @override
  onClick(BuildContext context) =>
      null;

  @override
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, Tuple2<String, RequestStatus>> (
        converter: (store) => Tuple2('', // TODO: Issue #390
            RequestStatus.none),
        builder: (context, canteen) {
          return RequestDependentWidgetBuilder(
              context: context,
              status: canteen.item2,
              contentGenerator: generateOccupation,
              content: canteen.item1,
              contentChecker:
              canteen.item1 != null && canteen.item1.isNotEmpty,
              onNullContent: Center(
                  child: Text('Não existem cantinas para apresentar',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center)));
        });
  }

  Widget generateOccupation(occupations, context) {
    return Text("occupation");
  }


}
