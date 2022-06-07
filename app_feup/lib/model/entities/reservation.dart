import 'dart:ui';

/// Private room reservation from the library
class Reservation {
  String room;
  DateTime startDate;
  Duration duration;
  String id;

  Reservation(this.room, this.startDate, this.duration, this.id);

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'room' : room,
      'startDate' : startDate.millisecondsSinceEpoch,
      'duration' : duration.inHours, 
      'id' : id
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
      && (duration.compareTo(other.duration) == 0)
      && (id.compareTo(other.id) == 0);
  }

  @override
  int get hashCode => hashValues(room, startDate, duration, id);
}