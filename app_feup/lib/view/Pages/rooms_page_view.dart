import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/page_title.dart';

class RoomsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RoomsPageViewState();
}

class RoomsPageViewState extends GeneralPageViewState {
  final _formKey = GlobalKey<FormState>();
  DateTime dateTime;
  TimeOfDay time;
  Duration duration;
  DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget getBody(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Library Rooms'),
          ButtonTheme(
              minWidth: 300,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            content: Column(children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                    children: [
                                      ElevatedButton(
                                        child: Text('Pick a date'),
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
                                          ? "No date"
                                          : formatter.format(dateTime)),
                                    ]),
                                Row(children: [
                                  ElevatedButton(
                                      child: Text('Pick a time'),
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
                                  ElevatedButton(
                                    child: Text('Pick a duration'),
                                    onPressed: () {
                                      showDurationPicker(
                                              context: context,
                                              initialTime:
                                                  Duration(minutes: 30))
                                          .then((duration1) {
                                        setState(() {
                                          duration = duration1;
                                        });
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                  ),
                                  Text(duration == null
                                      ? 'No duration'
                                      : duration.inMinutes.toString() + ' min'),
                                ]),
                                //




                                Padding(
                                  padding: EdgeInsets.all(50),
                                ),
                                Divider(
                                  height: 30,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Theme.of(context).dividerColor,
                                ),

                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                      ElevatedButton(
                                        child: Text("Clear"),
                                        onPressed: () {
                                          time = null;
                                          dateTime = null;
                                          duration = null;
                                        },
                                      ),
                                      ElevatedButton(
                                        child: Text("Submit"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ])
                              ],
                            ),
                          )
                        ]));
                      });
                },
                child: Text("Book a room"),
              )),
        ]);
  }
}
