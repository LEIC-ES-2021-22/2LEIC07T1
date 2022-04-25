import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';

class UnitecaPageView extends StatefulWidget {
  @override 
  State<StatefulWidget> createState() => UnitecaPageViewState();
}

class UnitecaPageViewState extends GeneralPageViewState {
  List<String> names = [
    'André Barbosa',
    'Francisco Nunes',
    'Guilherme Almeida',
    'João Pereira',
    'Luís Rodriges'];

  @override 
  Widget getBody(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getNames(context)
        )
      );
  }

  List<Widget> getNames(BuildContext context) {
    final List<Widget> res = [];
    res.add(
      Text('Uniteca',
        style: Theme.of(context).
          textTheme.headline3.apply(fontSizeDelta: 12.0)));
    names.forEach((name) { 
      res.add(
        Text(name,
          style: Theme.of(context).textTheme.headline2)
      );
    });
    return res;
  }
}