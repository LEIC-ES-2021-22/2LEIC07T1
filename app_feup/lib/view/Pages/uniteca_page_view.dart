import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/page_title.dart';

class UnitecaPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UnitecaPageViewState();
}

class UnitecaPageViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget> [
          PageTitle(name: 'Uniteca')
        ]
      )
    ]
    );
  }
}