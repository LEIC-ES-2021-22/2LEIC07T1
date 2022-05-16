/// Private room reservation from the library
class Reservation {
  String room;
  DateTime startDate;
  Duration duration;

  Reservation(this.room, this.startDate, this.duration);

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'room' : room,
      'startDate' : startDate.millisecondsSinceEpoch,
      'duration' : duration.inHours, 
    };
    return map;
  }
}