import 'dart:ui';

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

  @override
  String toString() {
    return '$room, $startDate, $duration';
  }

  @override
  bool operator == (Object other){
    return other is Reservation
      && room == other.room
      && (startDate.compareTo(other.startDate) == 0)
      && (duration.compareTo(other.duration) == 0);
  }

  @override
  int get hashCode => hashValues(room, startDate, duration);
}