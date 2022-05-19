import 'package:uni/auth/secrets.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/entities/library.dart';
import 'package:gsheets/gsheets.dart';

/// Fetch the school calendar from Google Sheets
class OccupationFetcherSheets {
  Future<LibraryOccupation> getOccupationFromSheets (
      Store<AppState> store) async {
    final sheetId = '1gZRbEX4y8vNW7vrl15FCdAQ3pVNRJw_uRZtVL6ORP0g';

    final gSheets = GSheets(google_credentials);
    final ss = await gSheets.spreadsheet(sheetId);

    final sheet = ss.worksheetByTitle('MANUAL');

    final occupation = LibraryOccupation();

    for (int i = 1; i < 7; i++) {
      final occupationCell = await sheet.cells.cell(column: 3, row: i + 1);
      final capacityCell = await sheet.cells.cell(column: 5, row: i + 1);

      occupation.addFloor(FloorOccupation(
        i, int.parse(occupationCell.value), int.parse(capacityCell.value)));
    }
    return occupation;
  }
} 