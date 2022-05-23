import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/page_title.dart';

//import 'secondary_page_view.dart';

class RoomReservationsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RoomReservationsPageViewState();
}

class RoomReservationsPageViewState extends GeneralPageViewState {
  DateTime dateTime;
  TimeOfDay time;
  Duration duration;
  bool checkBox = false;

  @override
  Widget getBody(BuildContext context) {
    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            PageTitle(name: 'Rooms Reservations'),
            getRoom('B001', '25/03/2022', '1 hora', context),
            Padding(padding: EdgeInsets.all(10)),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: reserveRoom(context, dateTime, time, duration, checkBox),
    );
  }



  Widget getRoom(
      String room, String startdate, String duration, BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          height: 135.0,
          width: 300.0,
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
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 9)),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Text(room,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0x75, 0x17, 0x1e)))),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  child: Text(startdate,
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
            ),
            Padding(padding: EdgeInsets.only(top: 4)),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  child: Text(duration,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20))),
            ),
          ]),
        ),
      ),
    ]);
  }



   Widget reserveRoom(BuildContext context, DateTime dateTime,
      TimeOfDay time, Duration duration, bool checkBox) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  content: Stack(children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(children: [

                          // Date button
                          OutlinedButton(
                            child: Text(
                              'Pick a date',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2023))
                                  .then((date) {
                                setState(() {
                                  dateTime = date;
                                });
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                          ),
                          Text(dateTime == null
                              ? 'No date'
                              : formatter.format(dateTime)),
                        ]),


                        Row(children: [

                          // Time button
                          OutlinedButton(
                              child: Text(
                                'Pick a time',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              onPressed: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((time1) {
                                  setState(() {
                                    time = time1;
                                  });
                                });
                              }),
                          Padding(
                            padding: EdgeInsets.only(left: 40),
                          ),
                          Text(time == null
                              ? 'No time'
                              : time.hour.toString() +
                              ':' +
                              time.minute.toString()),
                        ]),


                        Row(children: [

                          // Duration button
                          OutlinedButton(
                            child: Text(
                              'Pick a duration',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                            onPressed: () {
                              showDurationPicker(
                                  context: context,
                                  initialTime: Duration(minutes: 30))
                                  .then((duration1) {
                                setState(() {
                                  duration = duration1;
                                });
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 18),
                          ),
                          Text(duration == null
                              ? 'No duration'
                              : duration.inMinutes.toString() + ' min'),
                        ]),


                        // CheckBox button
                        CheckboxListTile(
                            title: Text('Choose room'),
                            value: checkBox,
                            onChanged: (newValue) {
                              setState(() {
                                checkBox = newValue;
                              });
                            }),

                        // Padding(
                        //   padding: EdgeInsets.all(20),
                        // ),

                        // Refresh Button
                        TextButton(
                          child: Icon(Icons.refresh),
                          onPressed: () {
                            setState(() {
                              time = null;
                              dateTime = null;
                              duration = null;
                              checkBox = false;
                            });
                          },
                        ),
                      ],
                    )
                  ]),
                  actions: <Widget>[

                    // Cancel and Submit Button
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          ElevatedButton(
                            child: Text('Submit'),
                            onPressed: () {
                              if (dateTime == null ||
                                  time == null ||
                                  duration == null) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text(
                                              'All fields must be filled!'),
                                          actions: <Widget>[
                                            TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                })
                                          ]);
                                    });
                              }
                            },
                          ),
                        ])
                  ],
                );
              });
            });
      },
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
