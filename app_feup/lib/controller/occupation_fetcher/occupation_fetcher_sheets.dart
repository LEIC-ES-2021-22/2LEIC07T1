import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/entities/library.dart';
import 'package:gsheets/gsheets.dart';

Future<String> getJson() {
  return rootBundle.loadString('assets/auth/key.json');
}

/// Fetch the school calendar from Google Sheets
class OccupationFetcherSheets {
  Future<LibraryOccupation> getOccupationFromSheets (
      Store<AppState> store) async {
    final sheetId = '1gZRbEX4y8vNW7vrl15FCdAQ3pVNRJw_uRZtVL6ORP0g';

    try {
      final googleCredentials =  json.decode(await getJson());
      final gSheets = GSheets(googleCredentials);
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
    } on FormatException {
      return LibraryOccupation();
    } catch (FlutterError) {
      return LibraryOccupation();
    }
  }
} 