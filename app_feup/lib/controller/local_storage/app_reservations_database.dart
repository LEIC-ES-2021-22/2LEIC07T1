import 'package:uni/model/entities/reservation.dart';

import 'app_database.dart';

class ReservationDatabase extends AppDatabase {
  ReservationDatabase()
    : super('reservations.db', 
    [
      '''CREATE TABLE RESERVATION(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        room TEXT,
        startDate INT,
        duration INT
      )
      '''
    ]);

  void saveReservations(List<Reservation> reservations) async {
    final db = await this.getDatabase();
    db.transaction((txn) async {
      await txn.delete('RESERVATION');
      reservations.forEach((reservation) async { 
        await txn.insert('RESERVATION', reservation.toMap());
      });
    });
  }
}