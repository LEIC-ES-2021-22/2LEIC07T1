import 'package:uni/model/app_state.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'generic_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Manages the library card section inside the personal area.
class LibraryOccupation extends GenericCard {
  LibraryOccupation({Key key}) : super(key: key);

  LibraryOccupation.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  String getTitle() => 'Ocupação da biblioteca';

  @override
  onClick(BuildContext context) => null;

  @override
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, Tuple2<String, RequestStatus>>(
        converter: (store) => Tuple2(
            'one',
            RequestStatus.none),
        builder: (context, occupation) {
          return RequestDependentWidgetBuilder(
              context: context,
              status: occupation.item2,
              contentGenerator: generateOccupation,
              content: occupation.item1,
              contentChecker: 
                occupation.item1 != null && occupation.item1.isNotEmpty,
              onNullContent: Center(
                  child: Text('Não existem dados para apresentar',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center)));
        });
  }

  Widget generateOccupation(occupations, context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 7.0,
      percent: 0.41,
      animation: true,
      animationDuration: 2000,
      center: Text(
        '41.0%',
        style: Theme.of(context).textTheme.headline2
      ),
      footer: Text(
        '200/488',
        style: Theme.of(context).textTheme.headline2
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Theme.of(context).hintColor,
      progressColor: Theme.of(context).accentColor,
    );
  }
}
