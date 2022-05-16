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
  DateFormat formatter = DateFormat('dd-MM-yyyy');


  @override
  Widget getBody(BuildContext context ) {

    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget> [
          PageTitle(name: 'Library Rooms'),

          ElevatedButton(
                onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                            return AlertDialog(
                                    content: Column(
                                    children: <Widget>[

                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                              Row (
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                ElevatedButton(
                                                    child: Text('Pick a date'),
                                                    onPressed:() {
                                                      showDatePicker(
                                                          context: context,
                                                          initialDate: DateTime
                                                              .now(),
                                                          firstDate: DateTime.now(),
                                                          lastDate: DateTime(2023)
                                                      ).then((date) {
                                                        setState(() {
                                                          dateTime = date;
                                                        });
                                                      });
                                                    },
                                                ),
                                                Text(dateTime == null ? "No date" : formatter.format(dateTime)),
                                              ]),

                                            Row (
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    child: Text('Pick a time'),
                                                    onPressed: () {
                                                      showTimePicker(
                                                        context: context,
                                                        initialTime: time,
                                                      ).then((time1) {
                                                        setState(() {
                                                          time = time1;
                                                        });
                                                      });

                                                    }
                                                ),
                                                Text(time == null ? 'No time' : time.toString()),

                                              ]

                                            ),

                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(),
                                            ),

                                               ElevatedButton(
                                                child: Text("Submit"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                          ],
                                        ),
                                      ),

                                            Positioned(
                                            right: -40.0,
                                            top: -40.0,
                                            child:
                                                InkResponse(
                                                  onTap: () {
                                                  Navigator.of(context).pop();
                                                  },
                                                 child: CircleAvatar(
                                                 child: Icon(Icons.close),
                                                    backgroundColor: Theme.
                                                    of(context).accentColor,
                                                 ),
                                                ),
                                            ),


                                     ],
                                    ),
                             );
                           }
                            );
                  },
                  child: Text("Book a room"),
          ),


        ]);
  }
}