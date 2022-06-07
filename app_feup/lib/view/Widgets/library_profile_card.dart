import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'generic_card.dart';

class LibraryProfileInfo extends GenericCard {
  LibraryProfileInfo({Key key}) : super(key: key);

  LibraryProfileInfo.fromEditingInformation(
      Key key, bool editingMode, Function onDelete)
      : super.fromEditingInformation(key, editingMode, onDelete);

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(children: [
      Table(
          columnWidths: {1: FractionColumnWidth(.4)},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            createRow(context,'Empréstimos: ' ,' 1 ', 30.0),
            createRow(context,'Histórico de empréstimos: ',' 1 ', 100.0),
            createRow(context,'Pedidos de reserva: ',' 1 ',30.0),
            createRow(context,'Histórico de pedidos de reserva: ',' 1 ',30.0),
            createRow(context,'Contabilidade: ','5.00  ',30.0)
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

TableRow createRow(BuildContext context, String banner,
    String value, double rightMargin){
  return TableRow(children: [
    Container(
      margin:
      const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 20.0),
      child: Text(banner,
          style: Theme.of(context)
              .textTheme
              .headline4
              .apply(fontSizeDelta: -4)),
    ),
    Container(
      margin:
      EdgeInsets.only(top: 20.0, bottom: 8.0, right: rightMargin),
      child: Text(value,
          style: Theme.of(context)
              .textTheme
              .headline4
              .apply(fontSizeDelta: -4)),
    )
  ]);
}
