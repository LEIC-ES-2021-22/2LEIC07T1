import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/library.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/library_occupation_card.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UnitecaPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UnitecaPageViewState();
}

class UnitecaPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, Tuple2<LibraryOccupation, RequestStatus>>(
        converter: (store) {
      final LibraryOccupation occupation = store.state.content['occupation'];
      return Tuple2(occupation, store.state.content['occupationStatus']);
    }, builder: (context, occupationInfo) {
      return RequestDependentWidgetBuilder(
          context: context,
          status: occupationInfo.item2,
          contentGenerator: generateOccupationPage,
          content: occupationInfo.item1,
          contentChecker: occupationInfo.item1 != null &&
                 occupationInfo.item1.capacity != 0,
          onNullContent: Center(
              child: Text('Não existem dados para apresentar',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center)));
    });
  }

  Widget generateOccupationPage(occupation, context) {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Uniteca'),
          LibraryOccupationCard(),
          PageTitle(name: "Usual Occupation"),
          histogram(),
          PageTitle(name: 'Pisos'),
          createFloorRow(occupation.getFloor(1), occupation.getFloor(2)),
          createFloorRow(occupation.getFloor(3), occupation.getFloor(4)),
          createFloorRow(occupation.getFloor(5), occupation.getFloor(6))
        ]);
  }

  Widget histogram(){
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 150.0,
        width: 12.0,
        padding: EdgeInsets.all(10.0),
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

       
      ),
    );
  }


  Widget createFloorRow(FloorOccupation floor1, FloorOccupation floor2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
          createFloorCard(floor1),
          createFloorCard(floor2),
    ]);
  }

  Widget createFloorCard(FloorOccupation floor) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 150.0,
        width: 150.0,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Piso ' + floor.getNumber().toString()),
            Text(floor.getPercentage().toString() + '%',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(
                floor.getOccupation().toString() +
                    '/' +
                    floor.getCapacity().toString(),
                style: Theme.of(context).textTheme.headline2),
            Container(
                child: LinearPercentIndicator(
              lineHeight: 7.0,
              percent: floor.getPercentage() / 100,
              progressColor: Theme.of(context).accentColor,
            ))
          ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child:SfCartesianChart(
          title: ChartTitle(text: 'Flutter Chart'),
          legend: Legend(isVisible: true),
          series: getDefaultData(),
        )
    );
  }
  static List<LineSeries<Tuple2, num>> getDefaultData() {
    final List<Tuple2> chartData = <Tuple2>[

    ];
    return <LineSeries<Tuple2, num>>[
      LineSeries<Tuple2, num>(
          dataSource: chartData,
          xValueMapper: (Tuple2 sales, _) => sales.item1,
          yValueMapper: (Tuple2 sales, _) => sales.item2,
          markerSettings: MarkerSettings(

              borderWidth: 3,
              borderColor: Colors.red),
      )];


  }
}
