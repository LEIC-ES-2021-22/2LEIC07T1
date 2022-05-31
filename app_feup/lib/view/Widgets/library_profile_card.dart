import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'generic_card.dart';

class Library_profile_info extends GenericCard {
Library_profile_info({Key key}) : super(key: key);

  Library_profile_info.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(children: [
      Table(
          columnWidths: {1: FractionColumnWidth(.4)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Container(
                margin:
                const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 20.0),
                child: Text('Empréstimos: ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              ),
              Container(
                margin:
                const EdgeInsets.only(top: 20.0, bottom: 8.0, right: 30.0),
                child: Text(' 1 ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              )
           ]),
            TableRow(children: [
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 8.0, left: 20.0),
                child: Text('Histórico de empréstimos: ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              ),
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 8.0, right: 100.0),
                child: Text(' 1 ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              )
            ]),
            TableRow(children: [
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 8.0, left: 20.0),
                child: Text('Pedidos de reserva: ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              ),
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 8.0, right: 30.0),
                child: Text(' 1 ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              )
            ]),
            TableRow(children: [
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 8.0, left: 20.0),
                child: Text('Histórico de pedidos de reserva: ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              ),
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 8.0, right: 30.0),
                child: Text(' 1 ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              )
            ]),
            TableRow(children: [
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 20.0),
                child: Text('Contabilidade: ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              ),
              Container(
                margin:
                const EdgeInsets.only(top: 10.0, bottom: 20.0, right: 30.0),
                child: Text('5.00  ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .apply(fontSizeDelta: -4)),
              )
            ]),
          ]),
      StoreConnector<AppState, String>(
          converter: (store) => store.state.content['feesRefreshTime'],
          builder: (context, feesRefreshTime) =>
              this.showLastRefreshedTime(feesRefreshTime, context))
    ]);
  }

@override
  String getTitle() => 'Perfil Biblioteca';

  @override
  onClick(BuildContext context) {}
}
