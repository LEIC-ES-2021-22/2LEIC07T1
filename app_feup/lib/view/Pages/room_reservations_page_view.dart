import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:intl/intl.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/model/entities/reservation.dart';

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
      body: StoreConnector<AppState, Tuple2<AppState, RequestStatus>>(
          converter: (store) {
        return Tuple2(store.state, store.state.content['reservationsStatus']);
      }, builder: (context, reservationInfo) {
        return RequestDependentWidgetBuilder(
            context: context,
            status: reservationInfo.item2,
            contentGenerator: generateReservationPage,
            content: reservationInfo.item1,
            contentChecker: reservationInfo.item1 != null &&
                reservationInfo.item1.content['reservations'].isNotEmpty,
            onNullContent: Scaffold(
              body: Center(
                child: Text('Não há salas reservadas!',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: reserveRoom(context, reservationInfo.item1),
            ));
      }),
    );
  }

  Widget generateReservationPage(dynamic state, BuildContext context) {
    final List<Reservation> reservations = state.content['reservations'];
    final List<Widget> items = <Widget>[];

    items.add(PageTitle(name: 'Reserva de gabinetes'));

    for (var i = 0; i < reservations.length; i++) {
      items.add(getRoom(state, reservations[i]));
    }

    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical, shrinkWrap: true, children: items),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: reserveRoom(context, state),
    );
  }

  Widget getRoom(AppState state, Reservation reservation) {
    final String hours =
        (reservation.duration.inHours).toString().padLeft(2, '0');
    final String minutes =
        (reservation.duration.inMinutes - reservation.duration.inHours * 60)
            .toString()
            .padLeft(2, '0');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
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
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text(reservation.room,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(fontSize: 20))),
          cancelRoom(context, state, reservation.id)
        ]),
        Padding(padding: EdgeInsets.all(15)),
        Container(
            alignment: Alignment.centerRight,
            child: Text(
                'Data: ' +
                    DateFormat('dd-MM-yyyy').format(reservation.startDate) +
                    ' às ' +
                    DateFormat('kk:mm').format(reservation.startDate),
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w400))),
        Padding(padding: EdgeInsets.only(top: 4)),
        Container(
            alignment: Alignment.centerRight,
            child: Text('Duração: ${hours}h$minutes',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400))),
      ]),
    );
  }

  Widget cancelRoom(BuildContext context, AppState state, String id) {
    return IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text(
                    'Queres cancelar este pedido?',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  actions: <Widget>[
                    Row(children: [
                      getCancelButton(),
                      ElevatedButton(
                          child: Text('Cancelar'),
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await NetworkRouter.cancelReservation(state, id);
                          })
                    ])
                  ],
                );
              });
        });
  }

  Widget reserveRoom(BuildContext context, AppState state) {
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
                        getDateButton(),
                        getTimeButton(),
                        getDurationButton(),
                        getCheckBoxButton(),

                        // Refresh button
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
                          getCancelButton(),
                          getSubmitButton(state),
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

  Widget getDateButton() {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return StatefulBuilder(builder: (context, setState) {
      return Row(children: [
        OutlinedButton(
          child: Text(
            'Pick a date',
            style: TextStyle(color: Theme.of(context).accentColor),
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
        Text(dateTime == null ? 'No date' : formatter.format(dateTime)),
      ]);
    });
  }

  Widget getTimeButton() {
    return StatefulBuilder(builder: (context, setState) {
      return Row(children: [
        OutlinedButton(
            child: Text(
              'Pick a time',
              style: TextStyle(color: Theme.of(context).accentColor),
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
            : time.hour.toString().padLeft(2, '0') +
                ':' +
                time.minute.toString().padLeft(2, '0')),
      ]);
    });
  }

  Widget getDurationButton() {
    return StatefulBuilder(builder: (context, setState) {
      return Row(children: [
        OutlinedButton(
          child: Text(
            'Pick a duration',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          onPressed: () {
            showDurationPicker(
                    context: context, initialTime: Duration(minutes: 30))
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
            : duration.inHours.toString().padLeft(2, '0') +
                'h' +
                (duration.inMinutes - duration.inHours * 60)
                    .toString()
                    .padLeft(2, '0') +
                'm'),
      ]);
    });
  }

  Widget getCheckBoxButton() {
    return StatefulBuilder(builder: (context, setState) {
      return CheckboxListTile(
          title: Text('Choose room'),
          value: checkBox,
          onChanged: (newValue) {
            setState(() {
              checkBox = newValue;
            });
          });
    });
  }

  Widget getCancelButton() {
    return StatefulBuilder(builder: (context, setState) {
      return TextButton(
          child: Text('Voltar'),
          onPressed: () {
            Navigator.of(context).pop();
          });
    });
  }

  Widget getSubmitButton(AppState state) {
    return StatefulBuilder(builder: (context, setState) {
      return ElevatedButton(
        child: Text('Submeter'),
        onPressed: () async {
          if (dateTime == null || time == null || duration == null) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: Text('All fields must be filled!'),
                      actions: <Widget>[
                        TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                      ]);
                });
          } else {
            Navigator.of(context).pop();
            await NetworkRouter.makeReservation(
                state,
                formatDate(dateTime),
                formatHour(time),
                formatDuration(duration));
          }
        },
      );
    });
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  String formatHour(TimeOfDay time) {
    String result = '';
    result += (time.hour).toString();
    if (time.minute > 0 && time.minute <= 30) {
      result += ',5';
    } else if (time.minute > 30 && time.minute <= 60) {
      result = (time.hour + 1).toString();
    }
    return result;
  }

  String formatDuration(Duration duration) {
    String result = '';
    final int minutes = duration.inMinutes.remainder(60);
    final int hours = duration.inHours;
    if (minutes > 0 && minutes <= 30) {
      result += hours.toString() + ',5';
    } else if (minutes > 30 && minutes <= 60) {
      result += (hours + 1).toString();
    }
    return result;
  }
}
